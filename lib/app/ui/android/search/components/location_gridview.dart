import 'package:climb_labs/app/controller/controllers.dart'
    show SearchController;
import 'package:climb_labs/app/ui/android/search/components.dart'
    show LocationSearchItem;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class LocationGridView extends GetWidget<SearchController> {
  const LocationGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverStaggeredGrid.countBuilder(
      itemCount: controller.locationItems.length,
      crossAxisCount: 4,
      itemBuilder: (context, index) {
        return LocationSearchItem(
          item: controller.locationItems[index],
        );
      },
      staggeredTileBuilder: (index) {
        if (index == controller.locationItems.length - 1) {
          return const StaggeredTile.count(4, 2);
        } else {
          return StaggeredTile.count(2, index.isEven ? 2 : 1);
        }
      },
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
    );
  }
}
