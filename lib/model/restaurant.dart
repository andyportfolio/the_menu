class Restaurant {
  final int restaurant_id;

  //1.한식,2.중식.3분식.4일식,돈가스.5치킨.6족발,7패스트푸드,8피자,
  //피자-반찬,패스트푸드->정육점
  final int category_id;

  final int restaurant_code; //image file mapping을 위해 부여한 unique code

  final String title, address, telephone, url, homepage , main;
  bool isOpen; // 가게의 영업/폐점을 나타내는 것으로 사용

  Restaurant(
      {this.restaurant_id,
      this.restaurant_code,
      this.category_id,
      this.title,
      this.main,
      this.address,
      this.telephone,
      this.url,
      this.homepage,
      this.isOpen});

  factory Restaurant.fromJson(Map<String, dynamic> parsedJson) {
    return Restaurant(
        restaurant_id: int.parse(parsedJson['restaurant_id']),
        restaurant_code: int.parse(parsedJson['restaurant_code']),
        category_id: int.parse(parsedJson['category_id']),
        title: parsedJson['title'],
        main: parsedJson['main'],
        address: parsedJson['address'],
        telephone: parsedJson['telephone'],
        url: parsedJson['url'],
        homepage: parsedJson['homepage'],
        isOpen: parsedJson['isOpen'] == 'true');
  }
}

List<Restaurant> restaurants;