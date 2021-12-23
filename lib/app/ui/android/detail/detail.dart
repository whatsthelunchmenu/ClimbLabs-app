import 'package:climb_labs/app/controller/controllers.dart'
    show DetailController;
import 'package:climb_labs/app/data/model/center_model.dart';
import 'package:climb_labs/app/ui/android/detail/components.dart'
    show GoogleMaps, ImageSlider, InformationList;
import 'package:climb_labs/app/ui/theme/app_colors.dart';
import 'package:climb_labs/app/ui/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CenterModel centerItem = Get.arguments as CenterModel;
    Get.put(DetailController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          centerItem.title,
          style: titleTextStyle,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: titleColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        elevation: 0.0,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSlider(images: centerItem.images),
            const SizedBox(height: 10),
            InformationList(centerItem: centerItem),
            const SizedBox(height: 10),
            GoogleMaps(item: centerItem),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
