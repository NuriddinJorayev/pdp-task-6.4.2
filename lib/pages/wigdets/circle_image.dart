import 'package:flutter/material.dart';

class Circle_image extends StatefulWidget {
  final String image;
  const Circle_image(this.image);

  @override
  _Circle_imageState createState() => _Circle_imageState();
}

class _Circle_imageState extends State<Circle_image> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      width: 45.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage(widget.image), fit: BoxFit.cover)),
    );
  }
}
