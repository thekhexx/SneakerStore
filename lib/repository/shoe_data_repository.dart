import 'package:sneaker_store/models/shoe.dart';
import 'package:sneaker_store/data/api/api_util.dart';
import 'package:sneaker_store/repository/shoe_repository.dart';

class ShoeDataRepository implements ShoeRepository {
  final ApiUtil _apiUtil;

  ShoeDataRepository(this._apiUtil);

  @override
  Future<List<Shoe>> getShoes([String? orderByField, String? searchValue]) async {
    final apiShoes = await _apiUtil.getShoes(orderByField, searchValue);
    return apiShoes;
    }
  
  @override
  Future<List<Shoe>> getPopularShoes() async {
    final apiShoes = await _apiUtil.getPopularShoes();
    return apiShoes;
    }
  
  }