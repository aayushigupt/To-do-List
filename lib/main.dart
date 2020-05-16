import 'package:flutter/material.dart';
import 'screens/front.dart';
void main()
{
  return runApp(Application());
}

class Application extends StatelessWidget
{
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: TodoList(),
    );
  }
}