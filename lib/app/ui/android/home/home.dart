import 'package:carousel_slider/carousel_slider.dart';
import 'package:climb_labs/app/controller/controllers.dart';
import 'package:climb_labs/app/ui/android/home/components/make_paint.dart';
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
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  child: Text(
                    'ClimbLabs',
                    style: GoogleFonts.stylish(
                      fontSize: Get.size.width * 0.09,
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
                      fontSize: Get.size.width * 0.06,
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
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                  width: Get.size.width,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 3.0),
                                    child: Text(
                                      controller.aboutDummyList[itemIndex].name,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.jua(
                                        fontSize: 18,
                                        color: titleColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: Get.size.width,
                                  height: Get.size.height * 0.33,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(controller
                                          .aboutDummyList[itemIndex].image),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: true,
                          onPageChanged: (index, reason) {
                            controller.carouselIndex.value = index.toDouble();
                          },
                          viewportFraction: 1.0,
                          height: Get.size.height * 0.39,
                        ),
                      ),
                      Positioned(
                        right: 20.0,
                        bottom: Get.size.height * 0.025,
                        child: DotsIndicator(
                          dotsCount: controller.aboutDummyList.length,
                          position: controller.carouselIndex.value,
                          decorator: const DotsDecorator(
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
