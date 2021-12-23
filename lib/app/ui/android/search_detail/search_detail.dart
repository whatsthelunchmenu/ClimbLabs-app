import 'package:climb_labs/app/data/model/location_detail_model.dart';
import 'package:climb_labs/app/ui/android/search_detail/components/filter_button.dart';
import 'package:climb_labs/app/ui/android/search_detail/components/location_filter_dialog.dart';
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
            )
          ],
        ),
      ),
    );
  }
}
