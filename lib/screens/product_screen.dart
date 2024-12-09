import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/product_detail_screen.dart';
import '../screens/home_screen.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  final List<Product> products = [
    Product(
      name: 'The Voyager',
      price: 89.99,
      imageUrl: 'assets/hoodie1.jpg',
      description: 'Embrace your adventurous spirit with The Voyager. Crafted for comfort and style, it’s your perfect companion for exploring the great outdoors.',
    ),
    Product(
      name: 'The Chillaxer',
      price: 99.99,
      imageUrl: 'assets/hoodie2.jpg',
      description: 'Unwind in ultimate comfort with The Chillaxer. This hoodie is designed for lazy days and cozy nights, making relaxation a breeze.',
    ),
    Product(
        name: 'The Urban Explorer',
        price: 129.99,
        imageUrl: 'assets/hoodie3.jpg',
        description: 'Navigate the city in style with The Urban Explorer. This hoodie combines functionality and fashion, perfect for the modern adventurer.'
    ),
    Product(
      name: 'The Trailblazer',
      price: 85.99,
      imageUrl: 'assets/hoodie4.jpg',
      description: 'Conquer the trails with The Trailblazer, built for those who seek adventure. Its durable fabric and cozy fit keep you comfortable on every journey.',
    ),
    Product(
      name: 'The Statement Piece',
      price: 94.99,
      imageUrl: 'assets/hoodie5.jpg',
      description: 'Dare to stand out with The Statement Piece hoodie. Bold colors and unique designs ensure you make an impression wherever you go.',
    ),
    Product(
      name: 'The Classic Comfort',
      price: 79.99,
      imageUrl: 'assets/hoodie6.jpg',
      description: 'Experience timeless style with The Classic Comfort hoodie. Its soft fabric and versatile design make it an essential piece for any wardrobe.',
    ),
    Product(
      name: 'The Trendsetter',
      price: 89.99,
      imageUrl: 'assets/hoodie7.jpg',
      description: 'Stay ahead of the curve with The Trendsetter. This hoodie features bold designs and modern cuts that make a statement wherever you go.',
    ),
    Product(
      name: 'The Cozy Companion',
      price: 67.99,
      imageUrl: 'assets/hoodie8.jpg',
      description: 'Meet your new favorite hoodie, The Cozy Companion. Perfect for any occasion, it wraps you in warmth and style, day or night.',
    ),
    Product(
      name: 'The Night Owl',
      price: 78.99,
      imageUrl: 'assets/hoodie9.jpg',
      description: 'Designed for those who thrive after dark, The Night Owl hoodie offers comfort and style for late-night adventures. Stay cozy while making memories.',
    ),
    Product(
      name: 'The Minimalist',
      price: 95.99,
      imageUrl: 'assets/hoodie10.jpg',
      description: 'Simplicity meets sophistication with The Minimalist. This sleek hoodie is perfect for those who appreciate clean lines and understated elegance.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: const Color(0xFF6A0AD4),
        centerTitle: true,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Content Area
          Positioned.fill(
            child: Container(
              color: Colors.white.withOpacity(0.7),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailScreen(product: product),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Product Image
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(15),
                              ),
                              child: Image.asset(
                                product.imageUrl,
                                height: 160,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              product.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                '\$${product.price.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF6A0AD4),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}