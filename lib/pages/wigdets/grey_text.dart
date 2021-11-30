import 'package:flutter/material.dart';

class Grey_text {
  Widget build(String text, [size]) {
    return Text(text,
        style: TextStyle(
            color: Colors.grey[300],
            fontSize: size == null? 16.0 : size,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0));
  }
}
