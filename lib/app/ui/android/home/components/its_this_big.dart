import 'package:climb_labs/app/controller/controllers.dart' show HomeController;
import 'package:climb_labs/app/ui/android/home/components/its_this_big_item.dart';
import 'package:climb_labs/app/ui/theme/app_colors.dart';
import 'package:climb_labs/app/ui/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItsThisBig extends GetWidget<HomeController> {
  const ItsThisBig({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '여긴 이만해',
          style: domainTitleTextStyle,
        ),
        Center(
          child: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Column(
              children: [
                SizedBox(
                  width: Get.size.width * 0.5,
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: primaryColor,
                    labelColor: titleColor,
                    labelStyle: baseTextStyle,
                    indicatorWeight: 4,
                    unselectedLabelColor: const Color(0xFF979797),
                    tabs: const <Tab>[
                      Tab(text: '중형 암장'),
                      Tab(text: '대형 암장'),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 300,
                  child: Obx(
                    () => TabBarView(
                      children: [
                        ListView.builder(
                          itemCount: controller.aboutDummyList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ItsThisBigItem(
                                item: controller.aboutDummyList[index]);
                          },
                        ),
                        ListView.builder(
                          itemCount: controller.aboutDummyList.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ItsThisBigItem(
                                item: controller.aboutDummyList[index]);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
