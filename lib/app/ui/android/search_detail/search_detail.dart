import 'package:climb_labs/app/controller/controllers.dart'
    show SearchDetailController;
import 'package:climb_labs/app/data/model/location_detail_model.dart';
import 'package:climb_labs/app/ui/android/search_detail/components.dart'
    show selectDetailLocationDialog, FilterButton;
import 'package:climb_labs/app/ui/android/search_keyword/components.dart'
    show SearchedItem;
import 'package:climb_labs/app/ui/theme/app_colors.dart';
import 'package:climb_labs/app/data/dummy/location_model.dart';
import 'package:climb_labs/app/ui/theme/app_text_theme.dart';
import 'package:climb_labs/app/utils/const_location.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchDetail extends StatefulWidget {
  const SearchDetail({Key? key}) : super(key: key);

  @override
  State<SearchDetail> createState() => _SearchDetailState();
}

class _SearchDetailState extends State<SearchDetail> {
  final LocationItem item = Get.arguments as LocationItem;
  late List<LocationDetail>? _locationList;
  final List<String> _selectedLocationList = [];

  @override
  void initState() {
    super.initState();
    _locationList = korToEngLocation[item.name];
  }

  @override
  Widget build(BuildContext context) {
    final SearchDetailController controller =
        Get.put(SearchDetailController(location: item.name));

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          item.name,
          style: titleTextStyle,
        ),
        leading: IconButton(
          onPressed: () => {
            for (LocationDetail element in _locationList!)
              {
                if (element.isSeleted) {element.isSeleted = false}
              },
            Get.back()
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: secondaryColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilterButton(
                    title: '세부지역',
                    onTap: () => selectDetailLocationDialog(
                        context, item, _locationList, _selectedLocationList)),
                FilterButton(title: '규모', onTap: () {}),
              ],
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                  controller: controller.locationScrollController,
                  shrinkWrap: true,
                  itemCount: controller
                      .climbingSearchResult.value.searchResults.length,
                  itemBuilder: (context, index) {
                    return SearchedItem(
                        item: controller
                            .climbingSearchResult.value.searchResults[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
