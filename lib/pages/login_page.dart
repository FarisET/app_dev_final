// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:app_dev_final/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../utils/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {
final TextEditingController cuseremail =  TextEditingController();
final TextEditingController cuserpass =  TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
CustomAuth customAuth = CustomAuth();
bool showSpinner=false;

@override
void dispose() {
  cuseremail.dispose();
  cuserpass.dispose();
  super.dispose();
}

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
                       // width: MediaQuery.sizeOf(context).width,
                         Image.asset('lib/assets/asset1.jpg',
                               height: 300, 
                      
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
                                  'Log In',
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
                              Padding(
                                padding: const EdgeInsets.only(bottom:12.0),
                                child: TextFormField(
                                  controller: cuserpass,
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
                              SizedBox(
                            //    height: 15,
                                width: MediaQuery.sizeOf(context).width,
                                child: FilledButton(
                                  style: FilledButton.styleFrom(
                                    backgroundColor: Colors.deepPurple
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                                      setState(() {
                                        showSpinner = true;
                                      });
                                     // print('cuseremail: ${cuseremail.text.toString().trim()}');

                                     User ?user = await customAuth.login(cuseremail.text.toString().trim(),cuserpass.text); 
                                     if (user!=null) {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => HomePage()),
                                        );
                                     }                      
                                      setState(() {
                                        showSpinner = false;
                                      });
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical:15),
                                    child: Text('Sign In'),
                                  )),
                              ),
                              SizedBox(
                                height: 15,
                            ),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width,
                                child: FilledButton(
                                  style: FilledButton.styleFrom(
                                    backgroundColor: Colors.deepPurple
                                  ),
                                  onPressed: () async {
                                      setState(() {
                                        showSpinner = true;
                                      });
                                      UserCredential user = await customAuth.signInWithGoogle();  
                                      if (user!=null) {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => HomePage()),
                                        );
                                      }                     
                                      setState(() {
                                        showSpinner = false;
                                      });
                                    
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical:15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Sign In with Google'),
                                        SizedBox(width: 15,),
                                        Image.asset('lib/assets/pngimg.com - google_PNG19635.png',
                                        width: 25,
                                        height: 24,)
                                      ],
                                    ),
                                  )),
                              ),

                              SizedBox(
                                height: 15,
                            ),
                              // SizedBox(
                              //   width: MediaQuery.sizeOf(context).width,
                              //   child: FilledButton(
                              //     style: FilledButton.styleFrom(
                              //       backgroundColor: Colors.deepPurple
                              //     ),
                              //     onPressed: () async {
                              //         setState(() {
                              //           showSpinner = true;
                              //         });
                              //         UserCredential user = await customAuth.signInWithFacebook();  
                              //         if (user!=null) {
                              //           Navigator.pushReplacement(
                              //             context,
                              //             MaterialPageRoute(builder: (context) => HomePage()),
                              //           );
                              //         }                     
                              //         setState(() {
                              //           showSpinner = false;
                              //         });
                                    
                              //     },
                              //     child: Padding(
                              //       padding: const EdgeInsets.symmetric(vertical:15),
                              //       child: Row(
                              //         mainAxisAlignment: MainAxisAlignment.center,
                              //         children: [
                              //           Text('Sign In with Facebook'),
                              //           SizedBox(width: 15,),
                              //           Image.asset('lib/assets/2021_Facebook_icon.svg.png',
                              //           width: 20,
                              //           height: 20,)
                              //         ],
                              //       ),
                              //     )),
                              // ),


                          Row(
                            children: [
                              Text("Don't have an account?",
                              style: TextStyle(
                                color: Colors.deepPurple
                              ),),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/signup_page'); 
                                },
                                child: Text(" SignUp",
                                style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                              ),
                            ],
                          ),
                          Text("Forgot Password?",
                            style: TextStyle(
                                color: Colors.deepPurple
                              ),
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