import 'package:flutter/material.dart';

class TextField_builder {
  Widget build(String lable, String hint_text, controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textBuilder(lable),
        SizedBox(
          height: 40.0,
          child: TextField(
            controller: controller,
            style: TextStyle(
                color: Colors.grey[800],
                fontSize: 14.0,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.0),
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              hintText: hint_text,
              hintStyle: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 13.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.0),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[100]!, width: 1.8)),
            ),
          ),
        ),
      ],
    );
  }

  Widget textBuilder(String text) {
    return Text(text,
        style: TextStyle(
            color: Colors.grey[800],
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.7));
  }
}
