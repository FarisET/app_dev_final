// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison

import 'package:app_dev_final/utils/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
final TextEditingController cuseremail =  TextEditingController();
final TextEditingController _pass =  TextEditingController();
final TextEditingController _confirmpass =  TextEditingController();
CustomAuth customAuth = CustomAuth();
bool showSpinner = false;

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
           child: ListView(
            children: [ 
                 Column(
                children: [
                  Image.asset('lib/assets/asset2.jpg',
                          // width: 100,
                          ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom:30.0),
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple
                                   ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom:12.0),
                                child: TextFormField(
                                  controller: cuseremail,
                                  decoration: InputDecoration(
                                    label:Text('Email'),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.deepPurple),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.deepPurple),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                     
                                    ),
                                    validator: (value) {
                                      if(value==null || value.isEmpty) {
                                        return 'This field is required';
                                      } else if (value.length > 50) {
                                        return 'Input must be less than 50 characters';
                                      }
                                      return null;
                                    },
                              
                                  ),
                              ),
                              SizedBox(
                                width: double.infinity,  
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom:12.0),
                                        child: TextFormField(
                                          controller: _pass,
                                          decoration: InputDecoration(
                                            label:Text('Password'),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.deepPurple),
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.deepPurple),
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                              ),
                                              obscureText: true,
                                            validator: (value) {
                                              if (value==null || value.isEmpty){
                                                return 'This field is required';
                                              } else if (value.length > 20) {
                                                return 'Input must be less than 20 characters';
                                              }
                                              return null;
                                              }                          
                                          ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom:12.0),
                                    child: TextFormField(
                                      controller: _confirmpass,
                                      decoration: InputDecoration(
                                        label:Text('Password'),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.deepPurple),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.deepPurple),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                          ),
                                          obscureText: true,
                                        validator: (value) {
                                          if (value==null || value.isEmpty){
                                            return 'This field is required';
                                          } else if (value.length > 20) {
                                            return 'Input must be less than 20 characters';
                                          } else if (value != _pass.text) {
                                            return "Passwords don't match";
                                          }
                                          return null;
                                          }                          
                                      ),
                                  ),
                                ),
                                    
                                  ],
                                ),
                              ),
      
                              SizedBox(
                            //    height: 15,
                                width: double.infinity,
                                child: FilledButton(
                                  style: FilledButton.styleFrom(
                                    backgroundColor: Colors.deepPurple
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                                      setState(() {
                                        showSpinner = true;
                                      });
                                      await customAuth.signUp(cuseremail.text, _pass.text);
                                      setState(() {
                                        showSpinner = false;
                                      });
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical:15),
                                    child: Text('Create Account'),
                                  )),
                              ),
                              SizedBox(
                                height: 15,
                            ),
                          Row(
                            children: [
                              Text("Have an account?",
                              style: TextStyle(
                                color: Colors.deepPurple
                              ),),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/login_page'); 
                                },
                                child: Text(" Login",
                                style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                              ),
                            ],
                          ),                                  
                            
                        ],
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ]
          
          ),
          
        ),
      ),
          
        
    );
  }
}