import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading({
   this.title,
    this.colour,
});

final String title;
final Color colour;

@override
Widget build(BuildContext context) {
  return  Text(
    title,
    style: TextStyle(
      fontSize: 25,
      color: colour,
      fontWeight: FontWeight.bold,
    ),
  );
}
}