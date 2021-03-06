import 'package:climb_labs/app/ui/android/home/components/header.dart';
import 'package:climb_labs/app/ui/android/home/components/its_this_big.dart';
import 'package:climb_labs/app/ui/android/home/components/what_about_here.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                TitleText(),
                WhatAboutHere(),
                ItsThisBig()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
