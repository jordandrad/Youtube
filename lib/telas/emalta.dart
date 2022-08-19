import 'package:flutter/material.dart';

class emalta extends StatefulWidget {
  const emalta({Key? key}) : super(key: key);

  @override
  State<emalta> createState() => _emaltaState();
}

class _emaltaState extends State<emalta> {
  @override
  Widget build(BuildContext context) {
    return Container(  child: Center(
        child: Text("Em alta",
        style: TextStyle(
          fontSize: 25,
        ),
        ),
      ),);
  }
}
