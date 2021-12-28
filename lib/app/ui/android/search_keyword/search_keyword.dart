import 'package:auto_size_text/auto_size_text.dart';
import 'package:climb_labs/app/controller/search/search_keyword_controller.dart';
import 'package:climb_labs/app/ui/theme/app_colors.dart';
import 'package:climb_labs/app/ui/theme/app_text_theme.dart';
import 'package:climb_labs/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchKeyword extends StatelessWidget {
  const SearchKeyword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String keyword = Get.arguments as String;
    final SearchKeywordController controller =
        Get.put(SearchKeywordController(keyword: keyword));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => {Get.back()},
          icon: const Icon(Icons.arrow_back_ios),
          color: secondaryColor,
        ),
        elevation: 0.0,
        title: Text(
          keyword,
          style: const TextStyle(
            color: titleColor,
          ),
        ),
        backgroundColor: primaryColor,
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            controller: controller.keywordScrollController,
            shrinkWrap: true,
            itemCount:
                controller.climbingSearchResult.value.searchResults.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 1, color: Colors.grey.withOpacity(0.3)),
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
                              controller.climbingSearchResult.value
                                  .searchResults[index].thumbNailUrl,
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
                                  controller.climbingSearchResult.value
                                      .searchResults[index].title,
                                  style: GoogleFonts.jua(
                                    fontWeight: FontWeight.w700,
                                  ),
                                  maxFontSize: 24,
                                  minFontSize: 22,
                                ),
                                SizedBox(
                                  height: 30,
                                  child: AutoSizeText(
                                    controller.climbingSearchResult.value
                                            .searchResults[index].street +
                                        " " +
                                        controller.climbingSearchResult.value
                                            .searchResults[index].detailStreet,
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
                                        border: Border.all(
                                            width: 2, color: primaryColor),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text(
                                        "${Utils.convertScaleTypeToString(controller.climbingSearchResult.value.searchResults[index].scaleType)} 암장",
                                        style: GoogleFonts.jua(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 7, vertical: 2),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: primaryColor),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            "${Utils.convertLevelToString(controller.climbingSearchResult.value.searchResults[index].level)} 난이도",
                                            style: GoogleFonts.jua(
                                                fontWeight: FontWeight.w600),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
