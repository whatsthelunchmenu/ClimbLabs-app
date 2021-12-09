import 'package:climb_labs/app/ui/theme/app_colors.dart';
import 'package:climb_labs/app/ui/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class SeletedMiniIcon extends StatelessWidget {
  const SeletedMiniIcon({
    Key? key,
    required this.locationName,
  }) : super(key: key);
  final String locationName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: titleColor),
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "$locationName   X",
          style: smallTitleColorTextStyle,
        ),
      ),
    );
  }
}
