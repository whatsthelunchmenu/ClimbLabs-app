import 'package:climb_labs/app/data/model/center_model.dart';
import 'package:climb_labs/app/route/app_pages.dart';
import 'package:climb_labs/app/ui/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhatAboutHearItem extends StatelessWidget {
  const WhatAboutHearItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final CenterModel item;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "center",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
              width: Get.size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Text(
                  item.title,
                  textAlign: TextAlign.start,
                  style: itemTitleTextStyle,
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                width: Get.size.width,
                height: Get.size.height * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(item.thumbNailUrl),
                  ),
                ),
              ),
              onTap: () {
                Get.toNamed(Routes.DETAIL, arguments: item);
              },
            ),
          ],
        ),
      ),
    );
  }
}
