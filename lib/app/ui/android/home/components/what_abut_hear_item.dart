import 'package:climb_labs/app/ui/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhatAboutHearItem extends StatelessWidget {
  const WhatAboutHearItem({
    Key? key,
    required this.name,
    required this.imageUrl,
  }) : super(key: key);

  final String name;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          SizedBox(
            height: 30,
            width: Get.size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Text(
                name,
                textAlign: TextAlign.start,
                style: itemTitleTextStyle,
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
                image: NetworkImage(imageUrl),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
