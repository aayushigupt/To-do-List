import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
class Workshop_Listing extends StatefulWidget{
  String imageURL;
  Workshop_Listing({this.imageURL});
  _Workshop_ListingState createState()=> _Workshop_ListingState();
}

class _Workshop_ListingState extends State<Workshop_Listing>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          "Your To-Do List",
          style: GoogleFonts.pacifico(
            color: Colors.white
          ),
        ),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("workshop").snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (BuildContext context,int index){
              return Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.only(bottom:30.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  boxShadow: [
                    BoxShadow(color: Colors.blueGrey,
                    blurRadius: 25.0,
                    spreadRadius: 5.0,
                    offset: Offset(15.0, 15.0),
                    )
                  ]
                ),
                              child: ListTile(
                  
                  // leading: CircleAvatar(
                  //   backgroundImage: NetworkImage(
                  //     widget.imageURL,
                  //   ),
                  // ),
                  title: Text(
                    snapshot.data.documents[index]["title"],
                    style: GoogleFonts.pacifico(
                      color: Colors.blueGrey[800],
                      fontSize: 30.0,
                     
                    )
                  ),
                 
                  subtitle: Text(
                    snapshot.data.documents[index]["description"],
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 18.0
                    )
                  ),
                ),
              );
            },
          );
        }
      )
    );
  }
}