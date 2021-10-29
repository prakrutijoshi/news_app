import 'package:flutter/material.dart';

class Subtitle extends StatelessWidget {
  Subtitle({this.content,this.colour});
  final String content;
  final Color colour;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(2.0),
    child: Center(
      child: Text(
        content,
        style: TextStyle(
          fontSize: 20,
          fontStyle: FontStyle.italic,
          color: colour,
        ),
      ),
    ),
  );
}