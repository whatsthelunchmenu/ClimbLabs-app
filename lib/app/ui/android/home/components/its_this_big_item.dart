import 'package:cached_network_image/cached_network_image.dart';
import 'package:climb_labs/app/controller/controllers.dart' show HomeController;
import 'package:climb_labs/app/data/model/center_model.dart';
import 'package:climb_labs/app/route/app_pages.dart';
import 'package:climb_labs/app/ui/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItsThisBigItem extends GetWidget<HomeController> {
  const ItsThisBigItem({
    required this.item,
    Key? key,
  }) : super(key: key);

  final CenterModel item;

  Widget _cachedSizedBox(Widget child) {
    return SizedBox(
      height: Get.size.height * 0.5,
      width: Get.size.width * 0.3,
      child: Center(
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: CachedNetworkImage(
        imageUrl: item.thumbNailUrl,
        placeholder: (context, url) =>
            _cachedSizedBox(const CircularProgressIndicator()),
        errorWidget: (context, url, error) =>
            _cachedSizedBox(const Icon(Icons.error)),
        imageBuilder: (context, imageProvider) => Container(
          margin: const EdgeInsets.all(2),
          height: Get.size.height * 0.5,
          width: Get.size.width * 0.3,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: Get.size.width * 0.25,
              height: Get.size.height >= 700
                  ? Get.size.height * 0.05
                  : Get.size.height * 0.06,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(45),
                ),
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    '${item.scale}㎡',
                    style: itemSizeTextStyle,
                  ),
                ),
              ),
            ),
          ), // child: Stack(
        ),
      ),
      onTap: () {
        Get.toNamed(Routes.DETAIL, arguments: item);
      },
    );
  }
}
