import 'package:carousel_slider/carousel_slider.dart';
import 'package:climb_labs/app/controller/controllers.dart';
import 'package:climb_labs/app/ui/theme/app_colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
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
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    'ClimbLabs',
                    style: GoogleFonts.stylish(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: titleColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 5),
                  child: Text(
                    '여긴 어때',
                    style: GoogleFonts.jua(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Obx(
                  () => Stack(
                    alignment: Alignment.center,
                    children: [
                      CarouselSlider.builder(
                        carouselController: controller.carouselController,
                        itemCount: controller.aboutDummyList.length,
                        itemBuilder: (context, itemIndex, pageIndex) {
                          return Container(
                            width: Get.size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    controller.aboutDummyList[itemIndex].image),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            controller.carouselIndex.value = index.toDouble();
                          },
                          viewportFraction: 1.0,
                          height: 250,
                        ),
                      ),
                      Positioned(
                        top: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white.withOpacity(0.4),
                          ),
                        ),
                        height: 70,
                        width: Get.size.width,
                      ),
                      Positioned(
                        bottom: 10.0,
                        child: DotsIndicator(
                          dotsCount: controller.aboutDummyList.length,
                          position: controller.carouselIndex.value,
                          decorator: DotsDecorator(
                            color: secondaryColor,
                            activeColor: primaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
