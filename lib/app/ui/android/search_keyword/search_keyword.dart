import 'package:auto_size_text/auto_size_text.dart';
import 'package:climb_labs/app/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchKeyword extends StatelessWidget {
  const SearchKeyword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String keyword = Get.arguments as String;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => {Get.back()},
          icon: const Icon(Icons.arrow_back_ios),
          color: secondaryColor,
        ),
        elevation: 0.0,
        title: Text(
          keyword,
          style: const TextStyle(
            color: titleColor,
          ),
        ),
        backgroundColor: primaryColor,
      ),
      body: ListView.builder(
        itemExtent: Get.size.height * 0.2,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(top: 10),
            color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: double.infinity,
                        height: Get.size.height * 0.18,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        // height: Get.size.height * 0.15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '킹콩클라이밍',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text('별별별'),
                            Text('중형 암장'),
                            Container(
                              height: 50,
                              child: AutoSizeText(
                                '경기 수원시 팔달구 장다리로 306번길 13',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
