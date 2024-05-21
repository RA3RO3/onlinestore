import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class DetailsPage extends StatelessWidget {
  final String image;
  final String name;
  final int price;

  DetailsPage({
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Color.fromRGBO(219, 208, 241, 1),
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    image,
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '\$$price',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Provider.of<CartProvider>(context, listen: false).addItem({
                    'name': name,
                    'price': price,
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$name added to cart')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(260, 45),
                  backgroundColor: Color.fromRGBO(219, 208, 241, 1),
                ),
                child: Text('Add to Cart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}