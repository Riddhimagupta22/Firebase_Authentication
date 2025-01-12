import 'package:flutter/material.dart';
class Postscreen extends StatelessWidget {


    

    @override
    Widget build(BuildContext context) {
      var size = MediaQuery.of(context).size;
      return Scaffold(
        body: Container(
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
          Text(
          "Hey ",
          style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          ),
          ),]

              ),
        ),
      );
  }
}
