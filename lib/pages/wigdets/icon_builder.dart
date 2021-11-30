import 'package:flutter/material.dart';

  class Icon_builder{
    Widget build(String image1, String image2, String image3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        imageBuilder(image1),
        SizedBox(width: 50.0),        
        imageBuilder(image2),
        SizedBox(width: 50.0),
        imageBuilder(image3)
      ],
    );
  }

  Widget imageBuilder(String image) {
    return Image(
      height: 20.0,
      width: 20.0,
      image: AssetImage(image),
    );
  }
  }