import 'package:climb_labs/app/controller/controllers.dart' show HomeController;
import 'package:climb_labs/app/data/dummy/about_hear.dart';
import 'package:climb_labs/app/ui/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItsThisBigItem extends GetWidget<HomeController> {
  const ItsThisBigItem({
    required this.item,
    Key? key,
  }) : super(key: key);

  final AboutHear item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Stack(children: [
        Container(
          margin: const EdgeInsets.all(2),
          height: Get.size.height * 0.5,
          width: Get.size.width * 0.3,
          child: Image.network(
            item.image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: -15.0,
          child: Container(
            margin: const EdgeInsets.all(2),
            width: Get.size.width * 0.3,
            height: Get.size.height * 0.06,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(45),
              ),
            ),
            child: Center(
                child: Text(
              '${item.size}㎡',
              style: itemSizeTextStyle,
            )),
          ),
        )
      ]),
      onTap: () {},
    );
  }
}
