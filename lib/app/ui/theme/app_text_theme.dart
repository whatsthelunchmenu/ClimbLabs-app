import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

final TextStyle titleTextStyle = GoogleFonts.jua(
  fontSize: 18,
  color: titleColor,
);

final TextStyle domainTitleTextStyle = GoogleFonts.jua(
  fontSize: Get.size.width * 0.06,
  fontWeight: FontWeight.w500,
);

final TextStyle headerTextStyle = GoogleFonts.stylish(
    fontSize: Get.size.width * 0.09,
    fontWeight: FontWeight.w900,
    color: titleColor);
