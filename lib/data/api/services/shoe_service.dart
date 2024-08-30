import 'package:dio/dio.dart';
import 'package:sneaker_store/data/api/models/api_shoe.dart';

class ShoeService {
  static const _baseUrl = 'http://10.0.2.2:8000';
  final _dio = Dio(BaseOptions(
    baseUrl: _baseUrl,
  ));

  Future<List<ApiShoe>> getShoes([String? orderByField, String? searchValue]) async {
    var query = {'ordering': 'release_date'};
    if (orderByField != null) {
      query['ordering'] =  orderByField;
    }
    if (searchValue != null) {
      query['title'] = searchValue;
    }
    var response = await _dio.get('/api/v1/sneakers', queryParameters: query);
    return (response.data['results'] as List)
        .map((e) => ApiShoe.fromJson(e))
        .toList();
  }

  Future<List<ApiShoe>> getPopularShoes() async {
    final query = {'is_popular': 'true'};
    final response = await _dio.get('/api/v1/sneakers', queryParameters: query);
    return (response.data['results'] as List)
        .map((e) => ApiShoe.fromJson(e))
        .toList();
  }
}
