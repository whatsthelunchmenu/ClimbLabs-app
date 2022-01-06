import 'package:climb_labs/app/data/model/center_model.dart';
import 'package:climb_labs/app/ui/android/detail/components.dart'
    show DescriptionBox;
import 'package:climb_labs/app/ui/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class InformationList extends StatelessWidget {
  const InformationList({
    Key? key,
    required this.centerItem,
  }) : super(key: key);

  final CenterModel centerItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
      child: Column(
        children: [
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
                    "• ${centerItem.advantages[index]}",
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
                    "• ${centerItem.disAdvantages[index]}",
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
                child: Text(
                  centerItem.feature,
                  style: baseTextStyle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Text("주소", style: itemTitleTextStyle),
              const SizedBox(width: 20),
              DescriptionBox(
                  child: Text(
                "${centerItem.street} ${centerItem.detailStreet}",
                style: baseTextStyle,
              )),
            ],
          ),
        ],
      ),
    );
  }
}
