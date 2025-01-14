import 'package:firebase/Auth/signup.dart';
import 'package:firebase/Post/postscreen.dart';
import 'package:firebase/feature/roundbutton.dart';
import 'package:firebase/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_in_button/sign_in_button.dart';

import '../feature/utils.dart';
import '../services/auth_services.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final  googleSignInDevices = GooglesignwithDevices();
  final _formField = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  void login() {

    auth.signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text.toString()).then((value) {
      Utils().toastMessage(value.user!.email.toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Postscreen()));
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xffc398f9), Color(0xff7b6bef)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: size.height * .1,
                  ),
                  Container(
                    height: size.height * .6,
                    width: size.width * .80,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xffc398f9), Color(0xff7b6bef)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      boxShadow: [
                        new BoxShadow(
                          blurRadius: 1,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, right: 165),
                          child: Text(
                            "Log In",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 100),
                          child: Text(
                            "Glad to have you again",
                            style: TextStyle(
                                color: Color(0xff54328f),
                                fontWeight: FontWeight.w600,
                                fontSize: 13),
                          ),
                        ),
                        SizedBox(
                          height: size.height * .03,
                        ),
                        Form(
                            key: _formField,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30.0, right: 30.0),
                                  child: SizedBox(
                                    height: size.height * .06,
                                    child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter Email';
                                        }
                                        return null;
                                      },
                                      controller: emailController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        fillColor: Color(0xffceb9f9),
                                        filled: true,
                                        hintText: "Email",
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * .015,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30.0, right: 30.0),
                                  child: SizedBox(
                                    height: size.height * .06,
                                    child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter password';
                                        }
                                        return null;
                                      },
                                      controller: passwordController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        fillColor: Color(0xffceb9f9),
                                        filled: true,
                                        suffixIcon: Icon(Icons.visibility),
                                        hintText: "Password",
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: size.height * .015,
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, right: 30.0),
                            child: Roundbutton(
                              title: 'Log In',
                              onTap: () {
                                if (_formField.currentState!.validate()) {
                                  login();
                                }
                              },
                            )),
                        SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 103),
                          child: Text("Forgot Password ?",
                              style: TextStyle(color: Color(0xff422f91))),
                        ),
                        SizedBox(height: size.height * .02),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Don't have an account ?"),
                              InkWell(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(color: Color(0xff422f91)),
                                ),
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => Signup()));
                                },
                              )
                            ]),
                        SizedBox(height: size.height * .03),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 30.0, right: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child:
                                    Divider(thickness: 2, color: Colors.black),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                child: Text(
                                  "Or Sign up with",
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ),
                              Expanded(
                                child:
                                    Divider(thickness: 2, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * .03,
                        ),
                        // Container(
                        //   height: size.width * .132,
                        //   width: size.width * .69,
                        //   decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(24))),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     children: [
                        //       // CircleAvatar(
                        //       //   backgroundImage: AssetImage("image/googlelogo.jpg"),
                        //       // ),
                        //       Text(
                        //         "Sign Up With Gmail",
                        //         style: TextStyle(
                        //             color: Colors.black,
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 15),
                        //       )
                        //     ],
                        //   ),
                        // )
                        ElevatedButton(onPressed: () async {
                        final User = await googleSignInDevices.signUpwithGmail();

                        if(User != null){
                          Get.snackbar("", 'Signed in as ${User.displayName}');
                        }
                        else{
                          Get.snackbar('title', 'SignIn is failed');
                        }
                        }, child: Text("Sign Up with Gmail"))
                       
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
