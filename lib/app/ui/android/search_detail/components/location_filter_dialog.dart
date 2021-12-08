import 'package:climb_labs/app/data/dummy/location_model.dart';
import 'package:climb_labs/app/data/model/location_detail_model.dart';
import 'package:climb_labs/app/ui/theme/app_colors.dart';
import 'package:climb_labs/app/ui/theme/app_text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> selectDetailLocationDialog(
    BuildContext context,
    LocationItem item,
    List<LocationDetail>? locationList,
    List<String> selectedLocationList,
    int selectCount) {
  final double deviceHeight = Get.size.height;
  return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              contentPadding: const EdgeInsets.all(5),
              content: SizedBox(
                height: deviceHeight > 700
                    ? Get.size.height * 0.7
                    : Get.size.height * 0.78,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () => Get.back(),
                        child: const Icon(Icons.cancel, color: titleColor),
                      ),
                    ),
                    Text(
                      '세부지역 선택(${item.name})',
                      style: titleTextStyle,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: Get.size.height * 0.4,
                      width: Get.size.width * 0.8,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.grey),
                      ),
                      child: ListView.builder(
                          itemExtent: 30,
                          itemCount: locationList!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (locationList[index].isSeleted == false &&
                                      selectCount < 5) {
                                    locationList[index].isSeleted = true;
                                    selectCount++;
                                    selectedLocationList
                                        .add(locationList[index].name);
                                  } else if (locationList[index].isSeleted) {
                                    locationList[index].isSeleted = false;
                                    selectCount--;
                                    selectedLocationList.removeWhere(
                                        (element) =>
                                            element ==
                                            locationList[index].name);
                                  }
                                });
                              },
                              child: Container(
                                color: locationList[index].isSeleted
                                    ? primaryColor.withOpacity(0.5)
                                    : Colors.white,
                                child: ListTile(
                                  visualDensity: VisualDensity.compact,
                                  dense: true,
                                  contentPadding:
                                      const EdgeInsets.only(left: 10),
                                  title: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      locationList[index].name,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: Get.size.height * 0.13,
                      width: Get.size.width * 0.8,
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
                                    selectedLocationList.length,
                                    (index) => Container(
                                          margin:
                                              const EdgeInsets.only(right: 5),
                                          padding: const EdgeInsets.only(
                                              top: 3, left: 20, right: 20),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2.0, color: titleColor),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Colors.white,
                                          ),
                                          child: Text(
                                            '${selectedLocationList[index]} X',
                                            style: smallTitleColorTextStyle,
                                          ),
                                        ))),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: titleColor,
                          ),
                          onPressed: () {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.size.width * 0.25),
                            child: Text('확인', style: baseTextStyle),
                          ),
                        )),
                  ],
                ),
              ),
            );
          },
        );
      });
}
