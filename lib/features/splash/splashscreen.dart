import 'dart:async';

import 'package:codeedex_test/features/home/view/home_screen.dart';
import 'package:codeedex_test/shared/apptext.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => HomeScree(),), (route) => false,);
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(text: 'SplashScreen',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
        ],
      ),
    ),
    );
  }
}