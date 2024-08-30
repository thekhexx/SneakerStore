import 'package:sneaker_store/repository/shoe_repository.dart';
import 'package:sneaker_store/repository/shoe_data_repository.dart';
import 'api_module.dart';

class RepositoryModule {
  static final ShoeDataRepository _shoeRepository = ShoeDataRepository(ApiModule.apiUtil());

  static ShoeRepository shoeRepository() {
    return _shoeRepository;
  }
}