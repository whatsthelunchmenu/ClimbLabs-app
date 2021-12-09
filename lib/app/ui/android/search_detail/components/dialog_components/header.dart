import 'package:climb_labs/app/ui/theme/app_colors.dart';
import 'package:climb_labs/app/ui/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this.locationName}) : super(key: key);

  final String locationName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () => Get.back(),
            child: const Icon(Icons.cancel, color: titleColor),
          ),
        ),
        Text(
          '세부지역 선택($locationName)',
          style: titleTextStyle,
        ),
      ],
    );
  }
}
