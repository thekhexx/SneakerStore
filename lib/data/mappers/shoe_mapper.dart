import 'package:sneaker_store/data/api/models/api_shoe.dart';
import 'package:sneaker_store/models/shoe.dart';



class ShoeMapper {

  static Shoe fromApiShoe(ApiShoe apiShoe) {
    String mainImageUrl;
    if (apiShoe.imageUrl != null) {
      mainImageUrl = apiShoe.imageUrl;
    }
    else {
      mainImageUrl = 'http://10.0.2.2:8000/sneakers/images/placehplder.png';
    }
    return Shoe(
      id: apiShoe.id,
      name: apiShoe.name,
      imageUrl: mainImageUrl,
      price: apiShoe.price,
      imagesCount: apiShoe.imagesCount,
      brandName: apiShoe.brandName
      );
  }
}