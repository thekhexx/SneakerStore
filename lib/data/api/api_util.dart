import 'package:sneaker_store/data/api/services/shoe_service.dart';
import 'package:sneaker_store/models/shoe.dart';
import 'package:sneaker_store/data/mappers/shoe_mapper.dart';

class ApiUtil {
  final ShoeService _shoeService;

  ApiUtil(this._shoeService); 

  Future<List<Shoe>> getShoes([String? orderByField, String? searchValue]) async {
    final result = await _shoeService.getShoes(orderByField, searchValue);
    return result.map((e) => ShoeMapper.fromApiShoe(e)).toList();
  }

  Future<List<Shoe>> getPopularShoes() async {
    final result = await _shoeService.getPopularShoes();
    return result.map((e) => ShoeMapper.fromApiShoe(e)).toList();
  }
}