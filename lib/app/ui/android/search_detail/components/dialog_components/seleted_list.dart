import 'package:climb_labs/app/data/model/location_detail_model.dart';
import 'package:climb_labs/app/ui/android/search_detail/components.dart'
    show SeletedMiniIcon;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeletedList extends StatelessWidget {
  const SeletedList({
    Key? key,
    required this.seletedList,
    required this.locationList,
    required this.setState,
  }) : super(key: key);

  final List<String> seletedList;
  final List<LocationDetailState> locationList;
  final Function setState;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: Get.size.width,
        padding: const EdgeInsets.all(8),
        color: Colors.grey.withOpacity(0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '최대 5개까지 선택 가능합니다',
              style: TextStyle(fontSize: 10),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 30,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  seletedList.length,
                  (index) => SeletedMiniIcon(
                    locationName: seletedList[index],
                    onTap: () {
                      final isIndex = locationList.indexWhere(
                          (element) => element.name == seletedList[index]);
                      setState(() {
                        seletedList.removeAt(index);
                        locationList[isIndex].isSeleted = false;
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
