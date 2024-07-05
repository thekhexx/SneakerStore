import 'package:flutter/material.dart';
import 'package:sneaker_store/components/bottom_nav_bar.dart';
import 'cart_page.dart';
import 'shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // variables
  int _selectedIndex = 0;

  // methods
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }

  final List<Widget> _pages = [
    // Shop Page
    const ShopPage(),
    // Cart Page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // logo
                DrawerHeader(
                    child: Image.asset(
                  'lib/images/logo.svg',
                  color: Colors.grey.shade400,
                  width: 200,
                )),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(color: Colors.grey[800]),
                ),
                // pages
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                    onTap: () => navigateBottomBar(0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ListTile(
                    leading: const Icon(Icons.shopping_bag),
                    title: const Text('Cart'),
                    onTap: () => navigateBottomBar(1),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text('About'),
                    onTap: () => navigateBottomBar(1),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 25.0, right: 25.0),
              child: ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () => navigateBottomBar(1),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ShopBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => {Scaffold.of(context).openDrawer()},
            ),
          )),
    );
  }
}
