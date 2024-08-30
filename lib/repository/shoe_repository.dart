import 'package:sneaker_store/models/shoe.dart';

abstract class ShoeRepository {
  Future<List<Shoe>> getShoes([String? orderByField, String? searchValue]);

  Future<List<Shoe>> getPopularShoes();
}