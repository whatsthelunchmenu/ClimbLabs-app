import 'package:auto_size_text/auto_size_text.dart';
import 'package:climb_labs/app/data/model/center_model.dart';
import 'package:climb_labs/app/route/app_pages.dart';
import 'package:climb_labs/app/ui/theme/app_colors.dart';
import 'package:climb_labs/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchedItem extends StatelessWidget {
  const SearchedItem(
    this.item, {
    Key? key,
  }) : super(key: key);

  final CenterModel item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.DETAIL, arguments: item);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: Get.size.height * 0.25,
                    child: Image.network(
                      item.thumbNailUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          item.title,
                          style: GoogleFonts.jua(),
                          maxFontSize: 24,
                          minFontSize: 22,
                        ),
                        SizedBox(
                          height: 30,
                          child: AutoSizeText(
                            item.street + " " + item.detailStreet,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.jua(
                              color: Colors.black.withOpacity(0.6),
                            ),
                            maxFontSize: 14,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 2),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: primaryColor),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                "${Utils.convertScaleTypeToString(item.scaleType)} 암장",
                                style: GoogleFonts.jua(
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 2),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: primaryColor),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "${Utils.convertLevelToString(item.level)} 난이도",
                                    style: GoogleFonts.jua(
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
