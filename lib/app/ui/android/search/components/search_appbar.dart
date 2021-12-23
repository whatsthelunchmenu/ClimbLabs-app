import 'package:climb_labs/app/controller/search_keyword/search_keyword_controller.dart';
import 'package:climb_labs/app/route/app_pages.dart';
import 'package:climb_labs/app/ui/theme/app_colors.dart';
import 'package:climb_labs/app/ui/theme/app_text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchAppbar extends StatelessWidget {
  const SearchAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchKeywordController controller =
        Get.put(SearchKeywordController());

    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      floating: true,
      snap: true,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        child: TextFormField(
          controller: controller.textEditingController,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              CupertinoIcons.search,
              color: Colors.grey,
              size: 28,
            ),
            hintText: '암장 검색',
            hintStyle: hintTextStyle,
            contentPadding:
                const EdgeInsets.only(left: 15, top: 10, bottom: 10),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            fillColor: primaryColor,
            filled: true,
          ),
          onFieldSubmitted: (_) {
            Get.toNamed(Routes.SEARCH_KEYWORD,
                arguments: controller.textEditingController.text);
          },
        ),
      ),
    );
  }
}
