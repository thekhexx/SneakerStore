class Shoe {
  final int id;
  final String name;
  final String imageUrl;
  final String price;
  final int imagesCount;
  final String brandName;
  var imageUrls = [];


  Shoe({required this.id, required this.name, required this.imageUrl, required this.price, required this.imagesCount, required this.brandName});


  static Shoe fromJson(Map<String, dynamic> json) {
    var mainImageUrl;
    if (json['main_image'] != null) {
      // TODO: ADD IMAGE URL
      mainImageUrl = json['main_image'];
    }
    else {
      mainImageUrl = 'http://10.0.2.2:8000/sneakers/images/placehplder.png';
    }
    return Shoe(
      id: json['id'],
      name: json['name'],
      imageUrl: mainImageUrl,
      price: json['price'],
      imagesCount: json['images_count'],
      brandName: json['brand']['name'],
    );
  }
}