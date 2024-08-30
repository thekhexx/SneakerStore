import 'package:sneaker_store/state/shop_page_state.dart';
import 'package:sneaker_store/internal/dependencies/repository_module.dart';

class ShopPageModule {
  static ShopPageState shopPageState() {
    return ShopPageState(
      RepositoryModule.shoeRepository(),
    );
  }
}