import 'package:flutter/material.dart';
import 'cart.dart';
import 'details.dart';

class StartPage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'image': 'assets/mouse.png',
      'name': 'Mouse',
      'price': 10,
    },
    {
      'image': 'assets/screen.png',
      'name': 'Screen',
      'price': 20,
    },
    {
      'image': 'assets/keyboard.png',
      'name': 'Keyboard',
      'price': 30,
    },
    {
      'image': 'assets/flash.png',
      'name': 'Flash',
      'price': 40,
    },
    {
      'image': 'assets/hard.png',
      'name': 'Hard',
      'price': 50,
    },
    {
      'image': 'assets/headset.png',
      'name': 'Headset',
      'price': 60,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Computer Store'),
        backgroundColor: Color.fromRGBO(219, 208, 241, 1),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF8A2BE2),
              Color(0xFFADD8E6),
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 18),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(219, 208, 241, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Today's Available Items For You",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(products.length, (index) {
                  return ProductCard(
                    image: products[index]['image'],
                    name: products[index]['name'],
                    price: products[index]['price'],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final int price;

  const ProductCard({
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              image: image,
              name: name,
              price: price,
            ),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 1),
                    Center(
                      child: Text(
                        '\$$price',
                        style: TextStyle(
                          fontSize: 13,
                          color: const Color.fromARGB(255, 45, 44, 44),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
