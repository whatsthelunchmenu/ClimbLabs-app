import 'package:climb_labs/app/controller/controllers.dart';
import 'package:climb_labs/app/data/model/const_location_model.dart';
import 'package:climb_labs/app/data/model/location_detail_model.dart';
import 'package:climb_labs/app/ui/android/search_detail/components.dart'
    show SeletedList, LocationList;
import 'package:climb_labs/app/ui/theme/app_colors.dart';
import 'package:climb_labs/app/ui/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> selectDetailLocationDialog(
    BuildContext context,
    LocationItem item,
    List<LocationDetailState>? locationList,
    List<String> selectedLocationList,
    List<String> selectedScaleList) {
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
                    : Get.size.height * 0.8,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          selectedLocationList.clear();
                          for (var location in locationList!) {
                            location.isSeleted = false;
                          }
                          Get.back();
                        },
                        child: const Icon(Icons.cancel, color: titleColor),
                      ),
                    ),
                    Text(
                      '세부지역 선택(${item.name})',
                      style: titleTextStyle,
                    ),
                    const SizedBox(height: 10),
                    LocationList(
                      locationList: locationList!,
                      selectedLocationList: selectedLocationList,
                      setState: setState,
                    ),
                    const SizedBox(height: 10),
                    SeletedList(
                      seletedList: selectedLocationList,
                      locationList: locationList,
                      setState: setState,
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: titleColor,
                        ),
                        onPressed: () {
                          SearchDetailController.to.locationSearchUpdateListner(
                            item.name,
                            sido: selectedLocationList.join(','),
                            scaleType: selectedScaleList.join(','),
                          );
                          Get.back();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.size.width * 0.25),
                          child: Text('확인', style: baseTextStyle),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      });
}
