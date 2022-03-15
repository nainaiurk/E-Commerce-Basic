// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({ Key? key }) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}
var globalKey = GlobalKey<FormState>();
var nameController = TextEditingController();
var userController = TextEditingController();
var numberController = TextEditingController();
var emailController = TextEditingController();
var passController = TextEditingController();
bool _passState =true;
class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
         physics: ClampingScrollPhysics(),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Color(0xff640999),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Icon(
                    Icons.location_on_sharp,
                    size: 80,
                    color: Colors.white,
                  ),
                  Text(
                    "VISION GO",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0, 200, 1),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white),
              child: Center(
                child: Form(
                  key: globalKey,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 30,
                              color: Color(0xff640999),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'To Join Us',
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value!.length>3 && RegExp(r'^[A-Za-z]').hasMatch(value)){
                              return null;
                            } else {
                              return 'Enter a valid name';
                            }
                          },
                          decoration: InputDecoration(
                              labelText:'Enter your full name',
                              // border: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(20))
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: userController,
                          validator: (value) {
                            if (value!.length>=3){
                              return null;
                            } else {
                              return 'Invalid userId';
                            }
                          },
                          decoration: InputDecoration(
                              labelText:'Enter your User Id',
                              // border: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(20))
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: numberController,
                          validator: (value) {
                            if (value!.length==11){
                              return null;
                            } else {
                              return 'Invalid mobile nummber';
                            }
                          },
                          decoration: InputDecoration(
                              labelText:'Enter your Mobile Number',
                              // border: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(20))
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value!.length > 5 &&  
                            RegExp(
                                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                              .hasMatch(value)) {
                              return null;
                            } else {
                              return 'Enter a valid Email';
                            }
                          },
                          decoration: InputDecoration(
                              labelText:'Enter your email',
                              // border: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(20))
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          obscureText: _passState,
                          controller: passController,
                          validator: (value) {
                            if (value!.length>5){
                              return null;
                            } else {
                              return 'Invalid Password';
                            }
                          },
                          decoration: InputDecoration(
                              labelText:'Enter your password',
                              // border: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(20))
                              suffixIcon: IconButton(
                              icon: Icon(_passState == true
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _passState == false
                                      ? _passState = true
                                      : _passState = false;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        GestureDetector(
                          onTap: (){
                            if(globalKey.currentState!.validate()){
                              
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(90, 0, 90, 0),
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(80),
                                color: Color(0xff640999)),
                            child: Center(
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}