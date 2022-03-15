// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:e_commerce/Homepage.dart';
import 'package:e_commerce/assistant/userInfo.dart';
import 'package:e_commerce/login/Sign_UpPage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

var _globalkey = GlobalKey<FormState>();
var _emailController = TextEditingController();
var _passController = TextEditingController();
bool isChecked = false;
bool passState = true;

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
          transform: Matrix4.translationValues(0, 300, 1),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Colors.white),
          child: Center(
            child: Form(
              key: _globalkey,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Welcome',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff640999),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'To my E-Commerce App',
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      controller: _emailController,
                       validator: (value) {
                          if (value!.length > 5 &&  
                          RegExp(
                              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$"
                          ).hasMatch(value)) {
                            return null;
                          }else {
                            return 'Enter a valid Email';
                          }
                       },
                      decoration: InputDecoration(
                          labelText:'Email',
                          // border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(20))
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _passController,
                      obscureText: passState,
                      validator: (value) {
                          if (value!.length>=8){
                            return null;
                          }else {
                            return 'Invalid pass';
                          }
                       },
                      decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(passState == true
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                passState == false
                                    ? passState = true
                                    : passState = false;
                              });
                            },
                          ),
                          // border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(20))
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                }),
                            Text('Remember me'),
                          ],
                        ),
                        TextButton(
                          child: Text('Forgot Password?'),
                          onPressed: (){},
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: (){
                        if(_globalkey.currentState!.validate()){
                          UserInfo user = UserInfo();
                          if(isChecked){
                            user.saveEmailToSharedPreference(_emailController.text);
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context)=>HomePage())
                            );
                          }
                          
                            
                          
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
                            'Log In',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account?'),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context)=>SignUpPage())
                                );
                              });
                            }, child: Text('Create Account')),
                      ],
                  ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
