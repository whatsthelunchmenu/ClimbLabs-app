import 'package:climb_labs/app/controller/controllers.dart'
    show SearchKeywordController;
import 'package:climb_labs/app/ui/android/search_keyword/components.dart'
    show SearchedItem;
import 'package:climb_labs/app/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              return SearchedItem(
                  item: controller
                      .climbingSearchResult.value.searchResults[index]);
            },
          ),
        ),
      ),
    );
  }
}
