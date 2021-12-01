import 'dart:ui';

import 'package:climb_labs/app/controller/controllers.dart';
import 'package:climb_labs/app/ui/android/home/components/header.dart';
import 'package:climb_labs/app/ui/android/home/components/what_about_here.dart';
import 'package:climb_labs/app/ui/theme/app_colors.dart';
import 'package:climb_labs/app/ui/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
                const SizedBox(height: 10),
                Text(
                  '여긴 이만해',
                  style: domainTitleTextStyle,
                ),
                Center(
                  child: DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        SizedBox(
                          width: Get.size.width * 0.5,
                          child: TabBar(
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: primaryColor,
                            labelColor: titleColor,
                            labelStyle: GoogleFonts.jua(fontSize: 16),
                            indicatorWeight: 4,
                            unselectedLabelColor: const Color(0xFF979797),
                            tabs: const <Tab>[
                              Tab(text: '중형 암장'),
                              Tab(text: '대형 암장'),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 300,
                          child: Obx(
                            () => TabBarView(
                              children: [
                                ListView.builder(
                                  itemCount: controller.aboutDummyList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.all(2),
                                      height: 100,
                                      width: 120,
                                      child: Image.network(
                                        controller.aboutDummyList[index].image,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                ),
                                ListView.builder(
                                  itemCount: controller.aboutDummyList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Stack(children: [
                                      Container(
                                        margin: const EdgeInsets.all(2),
                                        height: 300,
                                        width: 120,
                                        child: Image.network(
                                          controller
                                              .aboutDummyList[index].image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0.0,
                                        right: -15.0,
                                        child: Container(
                                          margin: const EdgeInsets.all(2),
                                          width: 120,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(45),
                                            ),
                                          ),
                                          child: Center(
                                              child: Text(
                                            '84㎡',
                                            style: GoogleFonts.jua(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          )),
                                        ),
                                      )
                                    ]);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
