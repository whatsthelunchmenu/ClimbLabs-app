import 'package:climb_labs/app/controller/controllers.dart';
import 'package:climb_labs/app/data/model/const_location_model.dart';
import 'package:climb_labs/app/ui/theme/app_colors.dart';
import 'package:climb_labs/app/ui/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> selectDetailScaleDialog(
  BuildContext context,
  LocationItem item,
  List<String> selectedLocationList,
  Map<String, bool> selectedScaleList,
) {
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
                    ? Get.size.height * 0.5
                    : Get.size.height * 0.45,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(Icons.cancel, color: titleColor),
                      ),
                    ),
                    Text(
                      '암장 크기',
                      style: titleTextStyle,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '전체',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Checkbox(
                            value: selectedScaleList['ALL'],
                            onChanged: (value) {
                              setState(() {
                                selectedScaleList['ALL'] = value!;
                                selectedScaleList['BIG'] = false;
                                selectedScaleList['MIDDLE'] = false;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '대형 암장',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Checkbox(
                            value: selectedScaleList['BIG'],
                            onChanged: (value) {
                              setState(() {
                                selectedScaleList['ALL'] = false;
                                selectedScaleList['BIG'] = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '중형 암장',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Checkbox(
                            value: selectedScaleList['MIDDLE'],
                            onChanged: (value) {
                              setState(() {
                                selectedScaleList['ALL'] = false;
                                selectedScaleList['MIDDLE'] = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: titleColor,
                        ),
                        onPressed: () {
                          List<String> scaleList = [];
                          selectedScaleList.forEach((key, value) {
                            if (value) {
                              scaleList.add(key);
                            }
                          });
                          SearchDetailController.to.locationSearchUpdateListner(
                            item.name,
                            sidos: selectedLocationList.join(','),
                            scaleType: scaleList.join(','),
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
