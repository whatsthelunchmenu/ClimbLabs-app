import 'package:climb_labs/app/data/model/center_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Generic test function', () {
    final Map<String, dynamic> data = {
      "bigs": [
        {
          "id": 1,
          "title": "게시물1",
          "climbingTitle": "클라이밍장",
          "level": 3,
          "city": "경기",
          "zipCode": "15125",
          "street": "거리 주소",
          "detailStreet": "상세주소",
          "scale": 84,
          "scaleType": "BIG",
          "feature": "암장 특징",
          "advantages": ["advance1", "advance2"],
          "disAdvantages": ["disAdvance1", "disAdvance2"],
          "images": ["image1", "image2"]
        },
        {
          "id": 2,
          "title": "게시물2",
          "climbingTitle": "클라이밍장",
          "level": 3,
          "city": "경기",
          "zipCode": "15125",
          "street": "거리 주소",
          "detailStreet": "상세주소",
          "scale": 84,
          "scaleType": "BIG",
          "feature": "암장 특징",
          "advantages": ["advance1", "advance2"],
          "disAdvantages": ["disAdvance1", "disAdvance2"],
          "images": ["image1", "image2"]
        }
      ],
      "middles": [
        {
          "id": 1,
          "title": "게시물1",
          "climbingTitle": "클라이밍장",
          "level": 3,
          "city": "경기",
          "zipCode": "15125",
          "street": "거리 주소",
          "detailStreet": "상세주소",
          "scale": 84,
          "scaleType": "MIDDLE",
          "feature": "암장 특징",
          "advantages": ["advance1", "advance2"],
          "disAdvantages": ["disAdvance1", "disAdvance2"],
          "images": ["image1", "image2"]
        },
        {
          "id": 2,
          "title": "게시물2",
          "climbingTitle": "클라이밍장",
          "level": 3,
          "city": "경기",
          "zipCode": "15125",
          "street": "거리 주소",
          "detailStreet": "상세주소",
          "scale": 84,
          "scaleType": "MIDDLE",
          "feature": "암장 특징",
          "advantages": ["advance1", "advance2"],
          "disAdvantages": ["disAdvance1", "disAdvance2"],
          "images": ["image1", "image2"]
        }
      ],
      "smalls": null
    };

    final testList =
        List<CenterModel>.from(data['bigs'].map((e) => CenterModel.fromJson(e)))
            .toList();
    for (var i in testList) {
      print(i.climbingTitle);
    }
  });
}
