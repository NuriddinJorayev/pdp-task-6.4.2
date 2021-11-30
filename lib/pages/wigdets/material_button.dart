// ignore_for_file: unused_element

import 'package:flutter/material.dart';

class MaterialButton_builder {
  Widget build(String name, Function() _ok) {
    return Container(
      height: 48.0,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
      child: MaterialButton(
        minWidth: double.infinity,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: Color.fromARGB(255, 1, 127, 123),
        onPressed:_ok,
        child: Center(
          child: Text(name,
              style: TextStyle(
                  color: Colors.white, fontSize: 18, letterSpacing: 0.8)),
        ),
      ),
    );
  }

}
