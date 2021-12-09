import 'package:climb_labs/app/data/model/location_detail_model.dart';
import 'package:climb_labs/app/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationList extends StatelessWidget {
  const LocationList({
    required this.setState,
    required this.locationList,
    required this.selectedLocationList,
    Key? key,
  }) : super(key: key);

  final Function setState;
  final List<LocationDetail> locationList;
  final List<String> selectedLocationList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: Get.size.width,
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.grey),
        ),
        child: ListView.builder(
            itemExtent: 30,
            itemCount: locationList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (locationList[index].isSeleted == false &&
                        selectedLocationList.length < 5) {
                      locationList[index].isSeleted = true;
                      selectedLocationList.add(locationList[index].name);
                    } else if (locationList[index].isSeleted) {
                      locationList[index].isSeleted = false;
                      selectedLocationList.removeWhere(
                          (element) => element == locationList[index].name);
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
                    contentPadding: const EdgeInsets.only(left: 10),
                    title: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        locationList[index].name,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
