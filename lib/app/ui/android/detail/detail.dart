import 'package:climb_labs/app/controller/controllers.dart'
    show DetailController;
import 'package:climb_labs/app/data/model/center_model.dart';
import 'package:climb_labs/app/ui/android/detail/components.dart'
    show GoogleMaps, DescriptionBox;
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
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: double.infinity,
                  height: Get.size.height * 0.35,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      centerItem.images.length,
                      (index) => Image.network(
                        centerItem.images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text('난이도', style: itemTitleTextStyle),
                  const SizedBox(width: 10),
                  ...List.generate(
                    centerItem.level,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Image.asset('assets/icons/star.png'),
                    ),
                  ),
                  ...List.generate(
                      5 - centerItem.level,
                      (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Image.asset('assets/icons/star_border.png'),
                          ))
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text("규모", style: itemTitleTextStyle),
                  const SizedBox(width: 20),
                  DescriptionBox(
                      child: Text(
                    "${centerItem.scale}㎡",
                    style: baseTextStyle,
                  ))
                ],
              ),
              const SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("장점", style: itemTitleTextStyle),
                  const SizedBox(width: 20),
                  DescriptionBox(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      centerItem.advantages.length,
                      (index) => Text(
                        centerItem.advantages[index],
                        style: baseTextStyle,
                      ),
                    ),
                  ))
                ],
              ),
              const SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("단점", style: itemTitleTextStyle),
                  const SizedBox(width: 20),
                  DescriptionBox(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      centerItem.disAdvantages.length,
                      (index) => Text(
                        centerItem.disAdvantages[index],
                        style: baseTextStyle,
                      ),
                    ),
                  )),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text("특징", style: itemTitleTextStyle),
                  const SizedBox(width: 20),
                  DescriptionBox(
                      child: Text(centerItem.feature, style: baseTextStyle)),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text("주소", style: itemTitleTextStyle),
                  const SizedBox(width: 20),
                  DescriptionBox(
                      child: Text(
                    "${centerItem.city} ${centerItem.street} ${centerItem.detailStreet}",
                    style: baseTextStyle,
                  )),
                ],
              ),
              const SizedBox(height: 10),
              GoogleMaps(item: centerItem),
            ],
          ),
        ),
      ),
    );
  }
}
