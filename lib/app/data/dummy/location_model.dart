class LocationItem {
  LocationItem({
    required this.name,
    required this.imageUrl,
  });

  String name;
  String imageUrl;
}

final Map<String, String> locationDummyList = {
  "서울":
      "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAyMDhfMTEz%2FMDAxNjEyNzY3NTA4MTAx.sBDr_z3bloQmLENW7Dqo5QPHhXYYSYbUfj9LvDgpH6Ig.vmQnvwMUGbS1Rut8KjpnOr7vOh0ByXx43guebLUkef4g.JPEG.tjdrud1109%2F20210205%25A3%25DF184036.jpg&type=sc960_832",
  "인천":
      "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA5MTNfMjU2%2FMDAxNjMxNTA2NDUyMDEz.a7iV5AfWO5UwCRZQvhvIDoAvh6no8j1ssqXKxC6aIz8g.xlAGYcf-nLBodH9i1AlqKWc4Aef-VCrCPWsTO_sUDykg.PNG.icouncil103%2F%25BA%25ED2.png&type=sc960_832",
  "부산":
      "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTExMThfMjM3%2FMDAxNjM3MjE1OTM5NzI0.tn87o_Xaye5VuhLHSwBpV6AH7Dvd1pBrZD7rxQIXS00g.vKL8PKH3kwOyxWb4diD1oWsiogVWiKNDl--VAbLdbMsg.JPEG.felizdaily%2FKakaoTalk_20211118_144912760_03.jpg&type=sc960_832",
  "대구":
      "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxOTEyMjRfMjc3%2FMDAxNTc3MTg4MzA3Nzg4.ZQ4GMmuZpCX3jkyg8A4HFPnTSGfFf5rCDTMWJRAHrf4g.Enw_2Zjyt-B0h9NDPOf-z_wv-d8xOKZyvNM0M0s68AMg.JPEG.shfurgkwk70%2FGK-97.jpg&type=sc960_832",
  "광주":
      "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxOTEyMTdfMjM2%2FMDAxNTc2NTcyMTQyMDg1.uLHtRWO7Lz64-9Oi39IWkD8ggryCReLreqCUPzdr0Rcg.TDAnnzAtXZ7x3JqAaveCIWIzNzMT9Xqm5JYAOqo24tEg.JPEG.dodreamgj%2F5.jpg&type=sc960_832",
  "대전":
      "https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver.net%2F20091214_88%2Feeko225_12607679385490zIe4_jpg%2F2009-12-14_%25B4%25EB%25C0%25FC%25BF%25A2%25BD%25BA%25C6%25F7%25B4%25D9%25B8%25AE_eeko225.jpg&type=sc960_832",
  "울산":
      "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTExMTRfMzcg%2FMDAxNjM2ODc2MzYwMjA5.MHESMoyv99iJfE3VwaJgryykwkT0-03fUYc7X-R9HH4g.2z6pKYxhFfTi6lw2SR674HNdz6bD_5-qsajKYAqu650g.JPEG.kimask%2F20211111_111333.jpg&type=sc960_832",
  "세종":
      "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTExMTBfMjQw%2FMDAxNjM2NTM0MzUxOTY5.b13ONbwzMy66_SKEwREc0aenD29OD-WnRqxvxpSi_AIg.kiZLKSSLDo_WCP1rrHFTNTnk8hf8yz3eAut8mXv_cdEg.JPEG.hppower%2F%25B5%25E5%25B7%25D0%25B1%25B9%25B0%25A1%25C0%25DA%25B0%25DD%25C1%25F5_%25C7%25D7%25B0%25F8%25C3%25D4%25BF%25B5%25B0%25FA%25C1%25A4_3%25C1%25BE__%25282%2529.jpg&type=sc960_832",
  "강원":
      "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTExMTFfMjE0%2FMDAxNjM2NTU2NDg4OTg4.Xosm002WtNWvlA8P1DhnkIl2YcgtaF_ZUJzCV1RVU1gg.Dpf6UMocmRfwYMV25oBh50BV_9GWBjPi2fhQKBYSnBgg.JPEG.jsn920%2FIMG_7430.JPG&type=sc960_832",
  "충남":
      "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20140828_279%2Fbinsuk8_1409205675986BRrS6_JPEG%2F_DSC3784.JPG&type=sc960_832",
  "충북":
      "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA5MjVfMjgx%2FMDAxNjMyNTMyNDM3MDY5.mTK1aHW99DMOsOeZkETWKAN8U4MJ9ffeM_jH9lkkfaQg.WsuqcG3dpbNB5VJ_6sEl1pEYYqqcv28IolHfkd2_fSgg.JPEG.ltk1695%2FDSC09728.JPG&type=sc960_832",
  "경남":
      "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA0MThfNTIg%2FMDAxNjE4NzI4NTgxOTA2.vQIoFXxseuGb1kHjWEsS4V4K6jXM2QRpRge1FVkpGUog.RsS-Vnhrbh7MJYJeEh4qqdzCuKKQU0HnXrKs9eVOr2Yg.JPEG.sukjjun%2F20210418_072653.jpg&type=sc960_832",
  "경북":
      "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAxMDVfMTYx%2FMDAxNjA5Nzg0MjI4MjAz.zZ7w7nu8BOVNNZaH_bEBbWy_YNb275u32uNtjpea6_0g.V58jed12mqGKVFWpHOA0QKaRSsZcFvMCaEEXpyu2kR4g.JPEG.inswookh%2F1609784227876.jpg&type=sc960_832",
  "전남":
      "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTExMTJfMTg2%2FMDAxNjM2NzE1ODE3Mzc1.0IJbLpgsFC8wg3UAOyjtL48kIcM6hQ8CRXEYushGWsQg.UTEQC9ptmV9ws89RATXgRLLdIyETxWGCsgdGRF_7m60g.JPEG.sunny_52%2FIMG_2687.JPG&type=sc960_832",
  "전북":
      "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTExMDhfMTMg%2FMDAxNjM2MzAyMDg0Mzgy.zkdM4u_5U9trEN_UXH9qb-c3I5OTTkVxURLYcm4MbOQg.XRr9NZJyShrT81CZWXr3qwyrMU04UnBU01YRUbNGcasg.JPEG.lu2u3u%2FDSC01015-01.jpg&type=sc960_832",
  "제주":
      "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMDEyMTBfMjg3%2FMDAxNjA3NTg3ODI1NjYy.p8C3c6iz_koaM2pwUNBfBPxSUyyNIayZ3DPIpACGKMog.DSY7x9oMPJNO3Ej45CjT7tcYuq04sVziETt8w2jQs-Ug.JPEG.010jskim7758%2F20201101%25A3%25DF193854.jpg&type=sc960_832"
};
