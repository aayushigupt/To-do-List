import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/family_list.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo/screens/front.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/screens/tech_desc.dart';
import 'package:todo/screens/exam_Desc.dart';
import 'package:todo/screens/family_desc.dart';
import 'package:todo/screens/love_desc.dart';
import 'package:todo/screens/sleep_Desc.dart';
import 'package:todo/screens/study_desc.dart';
import 'package:todo/screens/trips_desc.dart';
import 'package:todo/screens/workshop_Desc.dart';
import 'package:todo/screens/tech_list.dart';
import 'package:todo/screens/exam_list.dart';
import 'package:todo/screens/trips_list.dart';
import 'package:todo/screens/love_list.dart';
import 'package:todo/screens/workshop_list.dart';
import 'package:todo/screens/study_list.dart';
import 'package:todo/screens/sleep_list.dart';
class LoginPage extends StatefulWidget {
  final String name, email, displaypicURL;
  final GoogleSignIn googleSignIn;
  final FirebaseAuth auth;

  LoginPage(
      {this.name,
      this.email,
      this.displaypicURL,
      this.googleSignIn,
      this.auth});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget signOutButton() {
    return Container(
        alignment: Alignment.bottomCenter,
        height: 40.0,
        width: 80.0,
        child: RaisedButton(
          color: Colors.blueGrey[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          onPressed: () async {
            await widget.auth.signOut();
            await widget.googleSignIn.signOut();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => TodoList()));
          },
          child: Text(
            'Sign Out',
            style: TextStyle(color: Colors.white),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text(
          'To-do List',
          style: GoogleFonts.pacifico(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.grey[700],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.grey,
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                accountName: Text(
                  widget.name,
                ),
                accountEmail: Text(
                  widget.email,
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                    widget.displaypicURL,
                  ),
                ),
              ),
              Divider(height: 20.0,),
              ListTile(
                
                title: Text(
                  "Technical",
                  
                  style: GoogleFonts.lato(color: Colors.white,
                
                  ),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context)=> Tech_Listing(),
                  ));
                },
              ),
              ListTile(
                title: Text(
                  "Examination",
                  style: GoogleFonts.lato(color: Colors.white),
                  
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context)=> Exam_Listing(),
                  ));
                },
              ),
              ListTile(
                title: Text(
                  "Family",
                  style: GoogleFonts.lato(color: Colors.white),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context)=> Family_Listing(),
                  ));
                },
              ),
              ListTile(
                title: Text(
                  "Trips",
                  style: GoogleFonts.lato(color: Colors.white),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context)=> Trips_Listing(),
                  ));
                },
              ),
              ListTile(
                title: Text(
                  "Personal Life",
                  style: GoogleFonts.lato(color: Colors.white),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context)=> Love_Listing(),
                  ));
                },
              ),
              ListTile(
                title: Text(
                  "Workshops",
                  style: GoogleFonts.lato(color: Colors.white),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context)=> Workshop_Listing(),
                  ));
                },
              ),
              ListTile(
                title: Text(
                  "Studying",
                  style: GoogleFonts.lato(color: Colors.white),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context)=> Study_Listing(),
                  ));
                },
              ),
              ListTile(
                title: Text(
                  "Sleep",
                  style: GoogleFonts.lato(color: Colors.white),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context)=> Sleep_Listing(),
                  ));
                },
              ),
              Container(height: 40.0, width: 80.0, child: signOutButton()),
            ],
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 60.0),
        height: MediaQuery.of(context).size.height / 1.5,
        child: PageView(
          controller: PageController(viewportFraction: 0.8),
          scrollDirection: Axis.horizontal,
          pageSnapping: true,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              width: 100,
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    "assets/tech.jpg",
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height / 1.5,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 450.0, left: 10.0),
                    height: 50.0,
                    width: 290.0,
                    child: RaisedButton(
                        color: Colors.grey[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => Tech_Desc(),
                              ));
                        },
                        child: Text(
                          'Technical',
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        )),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              width: 100,
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    "assets/exam.jpg",
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height / 1.5,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 450.0, left: 10.0),
                    height: 50.0,
                    width: 290.0,
                    child: RaisedButton(
                      color: Colors.grey[700],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => Exam_Desc(),
                            ));
                      },
                      child: Text(
                        'Examination',
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              width: 100,
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    "assets/family.jpg",
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height / 1.5,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 450.0, left: 10.0),
                    height: 50.0,
                    width: 290.0,
                    child: RaisedButton(
                        color: Colors.grey[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Family_desc(),
                              ));
                        },
                        child: Text(
                          'Family',
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        )),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              width: 100,
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    "assets/trips.jpg",
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height / 1.5,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 450.0, left: 10.0),
                    height: 50.0,
                    width: 290.0,
                    child: RaisedButton(
                        color: Colors.grey[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => Trips_Desc(),
                              ));
                        },
                        child: Text(
                          'Trips',
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        )),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              width: 100,
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    "assets/love.jpg",
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height / 1.5,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 450.0, left: 10.0),
                    height: 50.0,
                    width: 290.0,
                    child: RaisedButton(
                        color: Colors.grey[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => Love_desc(),
                              ));
                        },
                        child: Text(
                          'Personal Life',
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        )),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              width: 100,
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    "assets/workshop.jpg",
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height / 1.5,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 450.0, left: 10.0),
                    height: 50.0,
                    width: 290.0,
                    child: RaisedButton(
                        color: Colors.grey[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Workshop_Desc(),
                              ));
                        },
                        child: Text(
                          'Workshops',
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        )),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              width: 100,
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    "assets/study.jpg",
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height / 1.5,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 450.0, left: 10.0),
                    height: 50.0,
                    width: 290.0,
                    child: RaisedButton(
                        color: Colors.grey[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => Study_desc(),
                              ));
                        },
                        child: Text(
                          'Studying',
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        )),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              width: 100,
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    "assets/sleep.jpg",
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height / 1.5,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 450.0, left: 10.0),
                    height: 50.0,
                    width: 290.0,
                    child: RaisedButton(
                        color: Colors.grey[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => Sleep_Desc(),
                              ));
                        },
                        child: Text(
                          'Sleep',
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
