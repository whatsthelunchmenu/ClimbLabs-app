import 'package:carousel_slider/carousel_slider.dart';
import 'package:climb_labs/app/controller/controllers.dart' show HomeController;
import 'package:climb_labs/app/ui/android/home/components.dart'
    show WhatAboutHearItem;
import 'package:climb_labs/app/ui/theme/app_colors.dart';
import 'package:climb_labs/app/ui/theme/app_text_theme.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhatAboutHere extends GetWidget<HomeController> {
  const WhatAboutHere({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 5),
          child: Text('여긴 어때', style: domainTitleTextStyle),
        ),
        Obx(
          () => controller.climbingResults.whatAbuoutHere.isNotEmpty
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    CarouselSlider.builder(
                      carouselController: controller.carouselController,
                      itemCount:
                          controller.climbingResults.whatAbuoutHere.length,
                      itemBuilder: (context, itemIndex, pageIndex) {
                        return WhatAboutHearItem(
                          item: controller
                              .climbingResults.whatAbuoutHere[itemIndex],
                        );
                      },
                      options: CarouselOptions(
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          controller.carouselIndex.value = index.toDouble();
                        },
                        viewportFraction: 1.0,
                        height: Get.size.height * 0.45,
                      ),
                    ),
                    Positioned(
                      right: 20.0,
                      bottom: Get.size.height * 0.12,
                      child: DotsIndicator(
                        dotsCount:
                            controller.climbingResults.whatAbuoutHere.length,
                        position: controller.carouselIndex.value,
                        decorator: const DotsDecorator(
                          color: secondaryColor,
                          activeColor: primaryColor,
                        ),
                      ),
                    )
                  ],
                )
              : SizedBox(
                  height: Get.size.height * 0.45,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
        ),
      ],
    );
  }
}
