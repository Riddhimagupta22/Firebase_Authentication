import 'dart:developer';

import 'package:firebase/Auth/login.dart';
import 'package:firebase/feature/roundbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../feature/utils.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Material(
        child: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Color(0xffc398f9), Color(0xff7b6bef)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: size.height * .01,
        ),
        Container(
          height: size.height * .65,
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
              Form( key: _formKey,
            child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Create Your Account",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .03,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: SizedBox(
                      height: size.height * .055,
                      width: size.height * .5,
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          fillColor: Color(0xffceb9f9),
                          filled: true,
                          suffixIcon: Icon(Icons.person),
                          hintText: "Name",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .015,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: SizedBox(
                      height: size.height * .055,
                      width: size.height * .5,
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          fillColor: Color(0xffceb9f9),
                          filled: true,
                          suffixIcon: Icon(Icons.email),
                          hintText: "Email",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .015,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: SizedBox(
                      height: size.height * .055,
                      width: size.height * .5,
                      child:  TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          fillColor: Color(0xffceb9f9),
                          filled: true,
                          suffixIcon: Icon(Icons.visibility_off_sharp),
                          hintText: "Password",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .015,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: SizedBox(
                      height: size.height * .055,
                      width: size.height * .5,
                      child:  TextFormField(
                        controller: confirmpasswordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          fillColor: Color(0xffceb9f9),
                          filled: true,
                          hintText: "Confirm Password",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .015,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Roundbutton(
                        title: 'Sign Up',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            auth
                                .createUserWithEmailAndPassword(
                                    email: emailController.text.toString(),
                                    password: passwordController.text.toString())
                                .then((value) {
                              setState(() {
                                loading = false;
                              });
                            }).onError((error, stackTrace) {
                              Utils().toastMessage(error.toString());
                              setState(() {
                                loading = false;
                              });
                            });
                          }
                        },
                      )),
                  SizedBox(height: size.height * .02),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                    Text("Don't have an account ?"),
                    InkWell(
                      child: Text(
                        "Log In",
                        style: TextStyle(color: Color(0xff422f91)),
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Homepage()));
                      },
                    )
                  ]),
                  SizedBox(height: size.height * .03),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(thickness: 2, color: Colors.black),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                          child: Text(
                            "Or Sign up with",
                            style: TextStyle(color: Colors.black45),
                          ),
                        ),
                        Expanded(
                          child: Divider(thickness: 2, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * .009,
                  ),
                  Container(
                    height: size.width * .132,
                    width: size.width * .69,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(24))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // CircleAvatar(
                        //   backgroundImage: AssetImage(
                        //       "images/googlelogo.jpg"),
                        // ),
                        Text(
                          "Sign Up With Gmail",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        )
                      ],
                    ),
                  )
                ],
              ),
          ),
      ]
    ),
    )
    ])
    ));
  }
}
