// ignore_for_file: unused_local_variable, import_of_legacy_library_into_null_safe, unused_import

import 'dart:convert';

import 'package:flineicons/flineicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_6_4_2/model/user.dart';
import 'package:task_6_4_2/pages/sign_up_page.dart';
import 'package:task_6_4_2/pages/wigdets/circle_image.dart';
import 'package:task_6_4_2/pages/wigdets/grey_text.dart';
import 'package:task_6_4_2/pages/wigdets/icon_builder.dart';
import 'package:task_6_4_2/pages/wigdets/material_button.dart';
import 'package:task_6_4_2/pages/wigdets/text_build.dart';
import 'package:task_6_4_2/pages/wigdets/textfield.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:task_6_4_2/server/hive.dart';

class Sign_In_page extends StatefulWidget {
  final String id = "SignIn_page";
  const Sign_In_page({Key? key}) : super(key: key);

  @override
  _Sign_In_pageState createState() => _Sign_In_pageState();
}

class _Sign_In_pageState extends State<Sign_In_page> {

  TextEditingController control1 = TextEditingController();
  TextEditingController control2 = TextEditingController();
  String db_name = 'hive1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(255, 7, 127, 123),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                height: (MediaQuery.of(context).size.height / 3) - 40,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: 50.0),
                    // @ user image
                    Circle_image('assets/images/ic_img1.jpg'),
                    SizedBox(height: 20.0),
                    // text
                    Text(
                      "Welcome",
                      style: TextStyle(
                          color: Colors.teal[400],
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.8),
                    ),
                    SizedBox(height: 5.0),
                    // text
                    Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.8),
                    ),
                  ],
                ),
              ),
              // @ main board
              Expanded(
                child: Container(                
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.0),
                        topRight: Radius.circular(45.0),
                      )),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // @textfields start
                      SizedBox(height: 80.0),
                      TextField_builder().build("Email", "Enter Email", control1),
                      SizedBox(height: 40.0),
                      TextField_builder().build("Password", "Enter Password", control2),
                      SizedBox(height: 30.0),
                      // @textfields finish
                      Grey_text().build("Forget Password ?"),
                      SizedBox(height: 30.0),
                      // @materila buttun
                      MaterialButton_builder().build("Sign In", _function),
                      SizedBox(height: 20.0),
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Divider(
                                thickness: 1.1,
                                color: Colors.grey[200],
                              )),
                          Expanded(
                              flex: 1,
                              child: Center(child: Grey_text().build("OR"))),
                          Expanded(
                              flex: 2,
                              child: Divider(
                                color: Colors.grey[200],
                                thickness: 1.1,
                              )),
                        ],
                      ),
                      SizedBox(height: 40.0),
                      Icon_builder().build(
                        "assets/images/f.png",
                        "assets/images/t.png",
                        "assets/images/ic_ins1.png",
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text_Builder().build("Don't have an account ?", "SignUp", _SignUP_fuction),
                            SizedBox(height: 20.0)
                          ],
                        )
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  // @ blue sign in buttun on press function
  _function(){
    var user = User(control1.text, control2.text);
    if(control1.text.isNotEmpty && control2.text.isNotEmpty){
      Hive_db().setUser('user', user.toJson());
    }

    var user_info = simple_load("user");
    print(user_info.email);
    print(user_info.password);
  }
 User simple_load(String key){
  return User.fromJson(Hive_db().LoadUser(key));
 }

 // @open Sign up on tap function next page
  _SignUP_fuction(){
    Navigator.pushNamed(context, Sign_Up_page().id);
  }
 
}

