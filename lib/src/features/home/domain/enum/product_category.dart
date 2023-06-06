// 모든제품리스트
// 순서 중요
enum AllProductLine {
  // 샴푸
  shampoo,

  // 린스, 컨디셔너
  rinse,

  // 미스트
  mist,

  // 보습제
  moisturizer,

  // 탈취제
  deodorant,

  // 치약
  toothpaste,
}

// 제품 대분류 카테고리
enum TopProductCategory {
  // 목욕,워시
  wash,

  // 스킨케어
  skincare,

  // 덴탈케어
  dentalcare,

  // 탈취제
  deodorant,
}

// 스킨케어 제품 카테고리
enum SkinCareCategory {
  // 미스트
  mist,

  // 보습제
  moisturizer,
}

// 덴탈케어 제품 카테고리
enum DentalCareCategory {
  // 치약
  toothpaste,
}

// 목욕/워시 제품 카테고리
enum WashCategory {
  // 샴푸
  shampoo,

  // 린스, 컨디셔너
  rinse,

  // 기타 워시
  cleaner,
}

// 탈취제
enum DeodorantCategory {
  // 탈취제
  deodorant,
}

// 세재
enum DetergentCategory {
  // 섬유세재
  textileDetergent,

  // 주방세재
  kitchenDetergent
}
