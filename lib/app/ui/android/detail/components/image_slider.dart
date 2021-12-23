import 'package:carousel_slider/carousel_slider.dart';
import 'package:climb_labs/app/controller/controllers.dart'
    show DetailController;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageSlider extends GetWidget<DetailController> {
  const ImageSlider({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Get.size.height * 0.34,
      child: Stack(
        children: [
          CarouselSlider(
            carouselController: controller.carouselController,
            items: List.generate(
              images.length,
              (index) => SizedBox(
                width: Get.size.width,
                child: Image.network(
                  images[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            options: CarouselOptions(
              height: Get.size.height * 0.34,
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                controller.sliderCurrentIndex.value = index;
              },
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
              margin: const EdgeInsets.only(bottom: 5, right: 5),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Obx(
                  () => Text(
                    '${controller.sliderCurrentIndex.value + 1} / ${images.length}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Get.size.width * 0.04,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
