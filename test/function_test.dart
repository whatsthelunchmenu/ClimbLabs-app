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
    final List<Map<String, dynamic>> dataTwo = [
      {"asd": "asd"}
    ];
    TestClass.fromTest(data);
    TestClass.fromTest(dataTwo);
  });
}

class TestClass<T> {
  TestClass({this.name = ""});
  String name;

  factory TestClass.fromTest(T value) {
    switch (T) {
      case Map<String, dynamic>:
        print("Map");
        break;
      case List<Map<String, dynamic>>:
        print("List");
        break;
      default:
        print("default");
    }
    return TestClass();
  }
}
