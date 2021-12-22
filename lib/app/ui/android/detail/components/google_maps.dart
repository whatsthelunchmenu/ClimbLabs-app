import 'dart:async';

import 'package:climb_labs/app/controller/detail/detail_controller.dart';
import 'package:climb_labs/app/data/model/center_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaps extends StatelessWidget {
  GoogleMaps({Key? key, required this.item}) : super(key: key);

  final CenterModel item;
  final Completer<GoogleMapController> _controller = Completer();

  Set<Marker> _createMarker(LatLng position, String title) {
    return <Marker>[
      Marker(
        draggable: true,
        markerId: const MarkerId("marker_1"),
        position: LatLng(
            double.parse(DetailController.to.geocodeResult.addresses[0].y),
            double.parse(DetailController.to.geocodeResult.addresses[0].x)),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(
          title: title,
        ),
      ),
    ].toSet();
  }

  @override
  Widget build(BuildContext context) {
    DetailController.to.getGeocode(item.street);
    return Obx(
      () => DetailController.to.geocodeResult.addresses.isNotEmpty
          ? Container(
              height: Get.size.height * 0.35,
              padding: const EdgeInsets.all(5),
              child: GoogleMap(
                mapType: MapType.normal,
                markers: _createMarker(
                    LatLng(
                        double.parse(
                            DetailController.to.geocodeResult.addresses[0].y),
                        double.parse(
                            DetailController.to.geocodeResult.addresses[0].x)),
                    item.title),
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                      double.parse(
                          DetailController.to.geocodeResult.addresses[0].y),
                      double.parse(
                          DetailController.to.geocodeResult.addresses[0].x)),
                  zoom: 17,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
