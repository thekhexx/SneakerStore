import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/cart.dart';
import 'pages/intro_page.dart';

void main() {
  runApp(const SneakerStoreApp());
}

class SneakerStoreApp extends StatelessWidget {
  const SneakerStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const IntroPage(),
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[300],
          colorSchemeSeed: Colors.grey,
          textTheme: TextTheme(
            titleLarge: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[900]),
            titleMedium: TextStyle(fontSize: 16, color: Colors.grey[600]),
            titleSmall: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
            headlineSmall: TextStyle(
              color: Colors.grey[50],
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            headlineMedium: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          drawerTheme: DrawerThemeData(
            shape: Border(),
            backgroundColor: Colors.grey[900],
          ),
          dividerTheme: const DividerThemeData(color: Colors.transparent),
          listTileTheme: ListTileThemeData(
              iconColor: Colors.grey.shade400, textColor: Colors.grey.shade400),
          useMaterial3: true,
        ),
      ),
    );
  }
}
