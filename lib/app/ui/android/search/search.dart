import 'package:climb_labs/app/ui/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                hintText: '검색',
                hintStyle: GoogleFonts.jua(
                  fontSize: 18,
                  color: Colors.grey,
                ),
                contentPadding: EdgeInsets.only(left: 15, top: 12),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                fillColor: primaryColor,
                filled: true,
              ),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: Get.size.height * 0.75,
            child: GridView.count(
              childAspectRatio: 15 / 9,
              crossAxisCount: 2,
              children: List.generate(
                8,
                (index) => Container(
                  margin: const EdgeInsets.all(6),
                  color: Colors.blue,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
