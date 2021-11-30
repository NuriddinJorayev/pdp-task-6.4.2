import 'package:flutter/material.dart';
import 'package:task_6_4_2/pages/wigdets/grey_text.dart';

  class Text_Builder{
    Widget build(String text1, String text2, Function() function){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Grey_text().build(text1, 14.0),
          SizedBox(width: 3.0),
          InkWell(
            onTap: function,
            child: Text(text2, style: TextStyle(
              color: Colors.blue,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0)),
          ),
        ],
      );
    }
  }