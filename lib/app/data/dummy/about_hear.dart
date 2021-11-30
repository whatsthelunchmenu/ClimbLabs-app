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
    address: '경기 수원시 팔달구 경수대로 572',
    image:
        "https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210702_148%2F1625192306311FScuD_JPEG%2FxmLTmht8UkjX687LzNYPs_z_.jpeg.jpg",
  ),
  AboutHear(
    name: '더클라임 클라이밍 짐앤샵 양재점',
    address: '서울 강남구 남부순환로 2615 지하1층',
    image:
        "https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210120_166%2F1611108698158uK8M4_PNG%2F%25BE%25E7%25C0%25E7%25C1%25A1%25C7%25C1%25B7%25CE%25BF%25EC.png",
  ),
  AboutHear(
    name: '클라임바운스 수원점',
    address: '경기 수원시 영통구 영통동 981-1 판타지움 3층',
    image:
        "https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20200909_237%2F15996265861042YhlT_JPEG%2Fc4IfOKTdpo8On38a4TiVyzjF.jpg",
  ),
  AboutHear(
    name: '웨이브락 서면점',
    address: '부산 부산진구 서전로9번길 20 혜도인파크에비뉴 오피스텔 상가 3층',
    image:
        "https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20211126_30%2F1637923262902PyCXz_JPEG%2Fbatch_%25C7%25CF%25C1%25D8_%25B9%25CC%25B5%25E5%25B3%25AA%25C0%25D5.jpeg",
  ),
];
