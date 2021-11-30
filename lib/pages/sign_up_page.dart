import 'package:flutter/material.dart';
import 'package:task_6_4_2/model/account.dart';
import 'package:task_6_4_2/pages/sign_in_page.dart';
import 'package:task_6_4_2/pages/wigdets/grey_text.dart';
import 'package:task_6_4_2/pages/wigdets/icon_builder.dart';
import 'package:task_6_4_2/pages/wigdets/material_button.dart';
import 'package:task_6_4_2/pages/wigdets/text_build.dart';
import 'package:task_6_4_2/pages/wigdets/textfield.dart';
import 'package:task_6_4_2/server/hive.dart';

class Sign_Up_page extends StatefulWidget {
  final String id = "SignUp_page";
  const Sign_Up_page({Key? key}) : super(key: key);

  @override
  _Sign_Up_pageState createState() => _Sign_Up_pageState();
}

class _Sign_Up_pageState extends State<Sign_Up_page> {

    TextEditingController control1 = TextEditingController();
    TextEditingController control2 = TextEditingController();
    TextEditingController control3 = TextEditingController();


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
                height: (MediaQuery.of(context).size.height / 4) - 40,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: 50.0),                    
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
                      "Sign Up",
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
                      TextField_builder()
                          .build("Email", "Enter your Email", control1),
                      SizedBox(height: 40.0),
                      TextField_builder()
                          .build("Number", "Enter your Number", control2),
                      SizedBox(height: 40.0),
                      TextField_builder()
                          .build("Address", "Enter your Address", control3),
                      
                      SizedBox(height: 40),
                      
                      // @materila buttun
                      MaterialButton_builder().build("Sign Up", _function),
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
                          Text_Builder().build("Allready have an account ?",
                              "SignIn", _SignIn_fuction),
                          SizedBox(height: 20.0)
                        ],
                      ))
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
    // base function
    _function(){
      String key = "account";
      
      if(control1.text.isNotEmpty && control2.text.isNotEmpty && 
         control3.text.isNotEmpty){
           var map = Account(control1.text, control2.text, control3.text);
          Hive_db().setUser(key, map.toJson());
      }
      var object = Account.FromJson(Hive_db().LoadUser(key));
      print(object.email + "\n" + object.number + "\n" + object.address);
    }
    
    // last function
  _SignIn_fuction(){
    Navigator.pushReplacementNamed(context, Sign_In_page().id);
  }
}
