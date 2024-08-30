// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_page_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ShopPageState on ShopPageStateBase, Store {
  late final _$shoesAtom =
      Atom(name: 'ShopPageStateBase.shoes', context: context);

  @override
  List<Shoe> get shoes {
    _$shoesAtom.reportRead();
    return super.shoes;
  }

  @override
  set shoes(List<Shoe> value) {
    _$shoesAtom.reportWrite(value, super.shoes, () {
      super.shoes = value;
    });
  }

  late final _$popularShoesAtom =
      Atom(name: 'ShopPageStateBase.popularShoes', context: context);

  @override
  List<Shoe> get popularShoes {
    _$popularShoesAtom.reportRead();
    return super.popularShoes;
  }

  @override
  set popularShoes(List<Shoe> value) {
    _$popularShoesAtom.reportWrite(value, super.popularShoes, () {
      super.popularShoes = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'ShopPageStateBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isGetedAtom =
      Atom(name: 'ShopPageStateBase.isGeted', context: context);

  @override
  bool get isGeted {
    _$isGetedAtom.reportRead();
    return super.isGeted;
  }

  @override
  set isGeted(bool value) {
    _$isGetedAtom.reportWrite(value, super.isGeted, () {
      super.isGeted = value;
    });
  }

  late final _$getShoesAsyncAction =
      AsyncAction('ShopPageStateBase.getShoes', context: context);

  @override
  Future<void> getShoes([String? orderByField, String? searchValue]) {
    return _$getShoesAsyncAction.run(() => super.getShoes(orderByField, searchValue));
  }

  late final _$getPopularShoesAsyncAction =
      AsyncAction('ShopPageStateBase.getPopularShoes', context: context);

  @override
  Future<void> getPopularShoes() {
    return _$getPopularShoesAsyncAction.run(() => super.getPopularShoes());
  }

  @override
  String toString() {
    return '''
shoes: ${shoes},
popularShoes: ${popularShoes},
isLoading: ${isLoading},
isGeted: ${isGeted}
    ''';
  }
}
