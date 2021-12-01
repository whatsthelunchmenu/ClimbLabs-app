import 'package:climb_labs/app/controller/controllers.dart';
import 'package:climb_labs/app/ui/android/home/components/header.dart';
import 'package:climb_labs/app/ui/android/home/components/what_about_here.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetWidget<HomeController> {
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
              children: [
                const TitleText(),
                const WhatAboutHere(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
