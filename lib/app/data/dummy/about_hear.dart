import 'dart:typed_data';

class AboutHear {
  AboutHear({
    required this.name,
    required this.address,
    required this.image,
  });
  String name;
  String address;
  String image;
}

List<AboutHear> aboutHearDummyList = [
  AboutHear(
    name: '킹콩클라이밍',
    address: '수원시 팔달구 장다리로',
    image:
        "https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210702_148%2F1625192306311FScuD_JPEG%2FxmLTmht8UkjX687LzNYPs_z_.jpeg.jpg",
  ),
  AboutHear(
    name: '더 클라임 양재',
    address: '서울특별시 강남구',
    image:
        "https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210120_166%2F1611108698158uK8M4_PNG%2F%25BE%25E7%25C0%25E7%25C1%25A1%25C7%25C1%25B7%25CE%25BF%25EC.png",
  )
];
