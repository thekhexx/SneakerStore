import 'package:sneaker_store/data/api/api_util.dart';
import 'package:sneaker_store/data/api/services/shoe_service.dart';

class ApiModule {
  static final ApiUtil _apiUtil = ApiUtil(ShoeService());

  static ApiUtil apiUtil() {
    return _apiUtil;
  }

}