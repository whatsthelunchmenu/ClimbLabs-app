class Utils {
  static String convertScaleTypeToString(String scaleType) {
    if (scaleType == 'BIG') {
      return "🏢 대형";
    } else if (scaleType == 'MIDDLE') {
      return "🏬 중형";
    } else {
      return "🏣 소형";
    }
  }

  static String convertLevelToString(int level) {
    if (level == 1) {
      return "🤟 좀 쉬운";
    } else if (level == 2) {
      return "👍 적당히 쉬운";
    } else if (level == 3) {
      return "👊 적당한";
    } else if (level == 4) {
      return "💪 좀 어려운";
    } else if (level == 5) {
      return "🦾 어려운";
    } else {
      return "";
    }
  }
}
