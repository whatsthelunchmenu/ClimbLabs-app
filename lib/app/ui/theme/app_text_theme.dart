import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

final TextStyle itemTitleTextStyle = GoogleFonts.jua(
  fontSize: 18,
  color: titleColor,
);

final TextStyle detailBaseTextStyle = GoogleFonts.jua(
  color: Colors.black,
  fontSize: 20,
);

final TextStyle titleTextStyle = GoogleFonts.jua(
  fontSize: 24,
  color: titleColor,
);

const TextStyle baseTextStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);

final TextStyle smallTitleColorTextStyle = GoogleFonts.jua(
  fontSize: 13,
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

final TextStyle itemSizeTextStyle = GoogleFonts.jua(
  fontSize: 20,
  color: Colors.black,
);

final TextStyle hintTextStyle = GoogleFonts.jua(
  fontSize: 18,
  color: Colors.grey,
);
