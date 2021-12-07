import 'package:climb_labs/app/controller/controllers.dart';
import 'package:climb_labs/app/ui/android/search/components/location_search_item.dart';
import 'package:climb_labs/app/ui/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends GetWidget<SearchController> {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        CupertinoIcons.search,
                        color: Colors.grey,
                        size: 28,
                      ),
                      hintText: '암장 검색',
                      hintStyle: GoogleFonts.jua(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                      contentPadding: const EdgeInsets.only(left: 15, top: 10),
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
                  child: StaggeredGridView.countBuilder(
                    itemCount: controller.locationItems.length,
                    crossAxisCount: 4,
                    itemBuilder: (context, index) {
                      return LocationSearchItem(
                        item: controller.locationItems[index],
                      );
                    },
                    staggeredTileBuilder: (index) {
                      if (index == controller.locationItems.length - 1) {
                        return const StaggeredTile.count(4, 2);
                      } else {
                        return StaggeredTile.count(2, index.isEven ? 2 : 1);
                      }
                    },
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
