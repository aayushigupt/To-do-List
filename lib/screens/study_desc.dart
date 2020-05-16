import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:todo/screens/study_list.dart';

class Study_desc extends StatefulWidget {
  final String title, description, date, time, imgURL;
  Study_desc({this.title, this.description, this.date, this.time, this.imgURL});
  @override
  _Study_descState createState() => _Study_descState();
}

class _Study_descState extends State<Study_desc> {
  final key = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime _dateTime;
  File _image;
  TimeOfDay _time;
  String dowurl;

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      print("Image Path $_image");
    });
  }

  Future uploadPic(BuildContext context) async {
    String Filename = basename(_image.path);
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(Filename);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
   String downloadUrl = await taskSnapshot.ref.getDownloadURL();
   setState(() {
    dowurl = downloadUrl;
   });
    //  var dowurl = await (await uploadTask.onComplete).ref.getDownloadURL();
    //  var url = dowurl.toString();
    //  print(url);
    //  return url;
  }

  // Future downloadURL(BuildContext context) async{
  //   StorageReference firebaseStorageRef = FirebaseStorage.instance.ref();
  //   String downloadAddress = await firebaseStorageRef.getDownloadURL();
  //   setState(() {
  //    _downloadURL = downloadAddress;
  //   });
  // }
  // final formKey = GlobalKey<FormState>();
  // List<String> _level = ['Level', 'Minimum', 'Intermediate', 'Maximum'];
  // String _currentItemSelected = 'Level';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        title: Text(
          'Study',
          textAlign: TextAlign.center,
          style: GoogleFonts.pacifico(
            color: Colors.blueGrey,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getImageFromGallery();
        },
        backgroundColor: Colors.blueGrey,
        child: Icon(
          Icons.file_upload,
          color: Colors.blueGrey,
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "assets/study.jpg",
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 20.0),
              margin: EdgeInsets.only(top: 50.0, left: 20.0, bottom: 20.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 34.0),
                        width: 360.0,
                        height: 50.0,
                        child: RaisedButton(
                          color: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            _dateTime == null
                                ? 'Enter Date'
                                : _dateTime.toString(),
                            style: GoogleFonts.lato(color: Colors.blueGrey),
                          ),
                          onPressed: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2050),
                            ).then((date) {
                              setState(() {
                                _dateTime = date;
                              });
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 34.0),
                        width: 360.0,
                        height: 50.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          color: Colors.blueGrey,
                          onPressed: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((time) {
                              setState(() {
                                _time = time;
                              });
                            });
                          },
                          child: Text(
                            _time == null ? 'Enter Time' : _time.toString(),
                            style: GoogleFonts.lato(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: 320,
                    child: TextFormField(
                      controller: titleController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          fillColor: Colors.blueGrey,
                          filled: true,
                          labelText: "Title",
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          hintText: "Enter the title of your todo",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Colors.blueGrey[900],
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.blueGrey))),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: 320,
                    child: TextFormField(
                      controller: descriptionController,
                      textAlign: TextAlign.center,
                      maxLines: 8,
                      decoration: InputDecoration(
                          labelText: "description",
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          hintText: "Enter the description of your todo",
                          fillColor: Colors.blueGrey[500],
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Colors.blueGrey[900],
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.blueGrey))),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 50.0),
                    width: 320,
                    child: RaisedButton(
                      onPressed: () async {
                        uploadPic(context);
                        var collectionRef =
                            Firestore.instance.collection("study");
                        Map<String, dynamic> study = {
                          "title": titleController.text,
                          "description": descriptionController.text,
                          // "imageURL": downloadURL.toString(),
                        };
                        await collectionRef.add(study);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => Study_Listing(imageURL: dowurl),
                            ));
                      },
                      color: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text(
                        "Add to my List",
                        style: GoogleFonts.lato(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   padding: EdgeInsets.only(top: 20.0,left: 55.0),
            //   width: 370,
            //   child: DropdownButton<String>(
            //     value: this._currentItemSelected,
            //     icon: Icon(Icons.arrow_downward, color: Colors.blueGrey,),
            //     iconSize: 24,
            //     elevation: 16,
            //     onChanged: (String newValue) {
            //       setState(() {
            //         this._currentItemSelected = newValue;
            //       });
            //     },
            //     items: _level.map<DropdownMenuItem<String>>(
            //       (String value) {
            //         return DropdownMenuItem<String>(
            //           value: value,
            //           child: Text(value, style: TextStyle(color: Colors.black),),
            //         );
            //       },
            //     ).toList(),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
