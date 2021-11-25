import 'package:climb_labs/app/binding/init_binding.dart';
import 'package:climb_labs/app/route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const ClimbLabs());
}

class ClimbLabs extends StatelessWidget {
  const ClimbLabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ClimbLabs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppPages.pages,
      initialRoute: '/',
      initialBinding: InitBinding(),
    );
  }
}
