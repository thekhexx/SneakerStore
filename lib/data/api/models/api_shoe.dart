class ApiShoe {
  final int id;
  final String name;
  final dynamic imageUrl;
  final String price;
  final int imagesCount;
  final String brandName;
  var imageUrls = [];


  ApiShoe.fromJson(Map<String, dynamic> json) : 
    id = json['id'],
    name = json['name'],
    imageUrl = json['main_image'],
    price = json['price'],
    imagesCount = json['images_count'],
    brandName = json['brand']['name'];
  
}