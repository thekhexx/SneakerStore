import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Icon(Icons.storefront_outlined, size: 100),
              ),

              const SizedBox(height: 48),
              // Title
              Text('The Sneaker Store', style: Theme.of(context).textTheme.titleLarge),

              // Subtitle
              Text(
                'Brand New Sneakers and custom kicks made with premium quality',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 48),

              // Start button
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage())),
                child: Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      'Shop Now',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
