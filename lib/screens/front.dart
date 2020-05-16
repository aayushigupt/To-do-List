import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:todo/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList>
     {
 String name,email,displayPicture,auth,googleSign;

 final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  signInWithGoogle() async{
    //FirebaseUser user = await _auth.currentUser();
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: gSA.accessToken,
      idToken: gSA.idToken,

    );
    var authResult = await _auth.signInWithCredential(credential);
    return authResult.user;
  }
signInSilently() async{
  var user = await googleSignIn.signInSilently();
  var name = user.displayName;
  var email = user.email;
  var displayPicture = user.photoUrl;
  Navigator.pushReplacement(context, MaterialPageRoute(
    builder: (BuildContext context)=> LoginPage(
      name:name,
      email: email,
      displaypicURL: displayPicture,
      googleSignIn: googleSignIn,
      auth: _auth,
    ),
  ));
}
Widget signInButton(){
  return new Container(
    width: 250.0,
    height: 40.0,
    child: RaisedButton(
      
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      onPressed: ()async{
        
        var user = await signInWithGoogle();
        var name = user.displayName;
        var email = user.email;
        var displayPicture = user.photoUrl;

        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (BuildContext context)=> LoginPage(
            name:name,
            email:email,
            displaypicURL: displayPicture,
            googleSignIn: googleSignIn,
            auth: _auth,
          ),
        ));
      },
      child: Row(
        children: <Widget>[
          SizedBox(width: 5.0,),
          Icon(FontAwesomeIcons.google),
          SizedBox(
            width: 21.0,
          ),
          Text('Sign in With Google'),
        ],
      ),
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width / 1,
                  child: FlareActor(
                    "assets/ABOUT US.flr",
                    animation: "Untitled",
                    fit: BoxFit.cover,
                  )),
                  signInButton(),
            ],
          ),
        ),
      ),
    );
  }
}
