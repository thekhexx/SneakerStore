import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_store/state/shop_page_state.dart';
import 'package:sneaker_store/internal/dependencies/shop_page_module.dart';
import '../components/shoe_small_tile.dart';
import '../models/shoe.dart';
import '../models/cart.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  late ShopPageState _shopPageState;

  final _shoesSearchController = TextEditingController();

  String _orderByField = '';

  @override
  void initState() {
    super.initState();
    _shopPageState = ShopPageModule.shopPageState();
    _shopPageState.getShoes();
  }

  void getShoes() {
    setState(() {
      _shopPageState.getShoes(_orderByField, _shoesSearchController.text);
    });
  }

  // Add item to cart method
  void addItemToCart(Shoe shoe) {
    // Add to cart
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // Alert User
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Successfully added!',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        content: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text(
            'You can see it in your cart',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, cart, child) => SingleChildScrollView(
              child: Column(
                children: [
                  // SearchBar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: _shoesSearchController,
                      onSubmitted: (value) => getShoes(),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Search',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Hot Picks
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        DropdownButton(
                            onChanged: (value) {
                              _orderByField = value.toString();
                              getShoes();
                            },
                            hint: const Text('Sort By'),
                            items: const [
                              DropdownMenuItem(
                                value: 'release',
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_upward),
                                    Text('Release Date'),
                                  ],
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'release',
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_downward),
                                    Text('Release Date'),
                                  ],
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'price',
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_upward),
                                    Text('Lower Price'),
                                  ],
                                ),
                              ),
                              DropdownMenuItem(
                                value: '-price',
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_downward),
                                    Text('Higher Price'),
                                  ],
                                ),
                              ),
                            ]),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Icon(Icons.filter_list,
                              color: Colors.grey[800], size: 30),
                        ),
                      ],
                    ),
                  ),

                  _getShoesGridView(),
                ],
              ),
            ));
  }

  Widget _getShoesGridView() {
    return Observer(builder: (context) {
      if (_shopPageState.isLoading) {
        return const Center(child: LinearProgressIndicator());
      }
      if (_shopPageState.isGeted == false) {
        return const Center(child: Text('Error During Fetching Data'));
      }
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SizedBox(
          height: 400,
          width: MediaQuery.of(context).size.width,
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 0.6,
              ),
              shrinkWrap: true,
              itemCount: _shopPageState.shoes.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                Shoe shoe = _shopPageState.shoes[index];
                return ShoeTile(
                  shoe: shoe,
                  onTap: () => addItemToCart(shoe),
                );
              }),
        ),
      );
    });
  }

  Widget _getShoesListView() {
    return FutureBuilder(
        future: _shopPageState.getShoes(),
        builder: (context, snapshot) {
          if (_shopPageState.isLoading) {
            return const Center(child: LinearProgressIndicator());
          }
          if (_shopPageState.isGeted == false) {
            return const Center(child: Text('Error During Fetching Data'));
          }
          return ListView.builder(
              itemCount: _shopPageState.shoes.length,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                Shoe shoe = _shopPageState.shoes[index];
                return ShoeTile(
                  shoe: shoe,
                  onTap: () => addItemToCart(shoe),
                );
              });
        });
  }
}
