class Utils {
  static String convertScaleTypeToString(String scaleType) {
    if (scaleType == 'BIG') {
      return "π’ λν";
    } else if (scaleType == 'MIDDLE') {
      return "π¬ μ€ν";
    } else {
      return "π£ μν";
    }
  }

  static String convertLevelToString(int level) {
    if (level == 1) {
      return "π€ μ’ μ¬μ΄";
    } else if (level == 2) {
      return "π μ λΉν μ¬μ΄";
    } else if (level == 3) {
      return "π μ λΉν";
    } else if (level == 4) {
      return "πͺ μ’ μ΄λ €μ΄";
    } else if (level == 5) {
      return "π¦Ύ μ΄λ €μ΄";
    } else {
      return "";
    }
  }
}
