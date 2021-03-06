import 'package:climb_labs/app/controller/search/search_controller.dart';
import 'package:climb_labs/app/data/model/const_location_model.dart';
import 'package:climb_labs/app/route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationSearchItem extends StatelessWidget {
  const LocationSearchItem({
    required this.item,
    Key? key,
  }) : super(key: key);
  final LocationItem item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        SearchController.to.focusNode.unfocus();
        Get.toNamed(Routes.SEARCH_DETAIL, arguments: item);
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/images/${item.imageUrl}",
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              item.name,
              style: GoogleFonts.jua(
                fontSize: 20,
                color: Colors.white,
              ),
              // textAlign: TextAlign.left,
            ),
          ),
        ),
      ),
    );
  }
}
