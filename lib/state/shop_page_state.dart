import 'package:mobx/mobx.dart';
import 'package:sneaker_store/models/shoe.dart';
import 'package:sneaker_store/repository/shoe_repository.dart';

part 'shop_page_state.g.dart';

class ShopPageState = ShopPageStateBase with _$ShopPageState;

abstract class ShopPageStateBase with Store {
  final ShoeRepository _shoeRepository;

  ShopPageStateBase(this._shoeRepository);


  @observable
  List<Shoe> shoes = [];

  @observable
  List<Shoe> popularShoes = [];

  @observable
  bool isLoading = false;

  @observable
  bool isGeted = false;


  @action
  Future<void> getShoes([String? orderByField, String? searchValue]) async {
    isLoading = true;

    final shoes = await _shoeRepository.getShoes(orderByField, searchValue);
    this.shoes = shoes;

    isLoading = false;
    isGeted = true;
  }

  @action
  Future<void> getPopularShoes() async {
    isLoading = true;

    final popularShoes = await _shoeRepository.getPopularShoes();
    this.popularShoes = popularShoes;

    isLoading = false;
    isGeted = true;
  }
}