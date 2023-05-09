import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({Key? key}) : super(key: key);

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4), () {
      Get.toNamed('/Homescreen');
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Icon(Icons.health_and_safety_sharp,color: Colors.red.shade200),
              SizedBox(height: 50),
              Text("Body Check Index",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.white)),
              Spacer(),
              Text("Check Your BMI",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
