import 'package:climb_labs/app/controller/controllers.dart';
import 'package:climb_labs/app/ui/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends GetWidget<SearchController> {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      CupertinoIcons.search,
                      color: Colors.grey,
                    ),
                    hintText: '암장 검색',
                    hintStyle: GoogleFonts.jua(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                    contentPadding: const EdgeInsets.only(left: 15, top: 10),
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: primaryColor,
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: Get.size.height * 0.75,
                child: Obx(
                  () => GridView.count(
                    childAspectRatio: 15 / 9,
                    crossAxisCount: 2,
                    children: List.generate(
                      controller.locationItems.length,
                      (index) => Container(
                        margin: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              controller.locationItems[index].imageUrl,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 60,
                            left: 10,
                          ),
                          child: Text(
                            controller.locationItems[index].name,
                            style: GoogleFonts.jua(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
