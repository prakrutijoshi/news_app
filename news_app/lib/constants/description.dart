import 'package:flutter/material.dart';


class Desc extends StatelessWidget {

  Desc({this.content, this.colour, this.OnTap, });
  final String content;
  final Color colour;
  final Function OnTap;


  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(2.0),
    child: Text(
      content,
      style: TextStyle(
        fontSize: 18,
        fontStyle: FontStyle.italic,
        color: colour,
        overflow: TextOverflow.clip,
      ),
    ),
  );

}