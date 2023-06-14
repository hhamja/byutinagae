class Category {
  static const String cleanBeauty = '클린뷰티';
  static const String popular = '인기';

  // 대분류
  static const String wash = '목욕/워시';
  static const String skincare = '스킨케어';
  static const String dentalcare = '덴탈케어';
  static const String smellcare = '향수/탈취';
  static const List<String> topCategoryList = [
    wash,
    skincare,
    dentalcare,
    smellcare,
  ];
  static const List<String> washCategoryList = ["샴푸", "린스", "워터리스"];
  static const List<String> skincareCategoryList = ["미스트", "보습제"];
  static const List<String> dentalcareCategoryList = ["치약", "구강청결제"];
  static const List<String> smellcareCategoryList = ["향수", "탈취제"];
}
