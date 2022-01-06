import 'package:climb_labs/app/controller/search/search_controller.dart';
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
    final SearchController controller = Get.put(SearchController());

    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      floating: true,
      snap: true,
      titleSpacing: 0.0,
      toolbarHeight: Get.size.height * 0.1,
      title: TextFormField(
        autofocus: false,
        // key: GlobalKey(),
        focusNode: controller.focusNode,
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
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          fillColor: primaryColor,
          filled: true,
        ),
        onFieldSubmitted: (searchValue) {
          if (searchValue.isNotEmpty) {
            Get.toNamed(Routes.SEARCH_KEYWORD,
                arguments: controller.textEditingController.text);
          }
        },
      ),
    );
  }
}
