import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Define a list of items with details
 final items = [
  {'icon': 'assets/processor.png', 'title': 'Processor', 'subtitle': 'Intel Core i7-9700K', 'price': '\$299.99', 'description': 'High-performance 9th generation processor.'},
  {'icon': 'assets/ssd.png', 'title': 'SSD', 'subtitle': 'Samsung 970 EVO 1TB', 'price': '\$149.99', 'description': 'Fast and reliable solid-state drive.'},
  {'icon': 'assets/laptop.png', 'title': 'Laptop', 'subtitle': 'ASUS ROG Zephyrus G14', 'price': '\$1349.99', 'description': 'Compact and powerful gaming laptop.'},
  {'icon': 'assets/mouse.png', 'title': 'Gaming Mouse', 'subtitle': 'Logitech G502', 'price': '\$49.99', 'description': 'High-precision mouse with customizable weights.'},
  {'icon': 'assets/keyboard.png', 'title': 'Gaming Keyboard', 'subtitle': 'Corsair K95 RGB', 'price': '\$199.99', 'description': 'Mechanical keyboard with per-key RGB lighting.'},
  {'icon': 'assets/headphone.png', 'title': 'Headphone', 'subtitle': 'HyperX Cloud II', 'price': '\$99.99', 'description': 'Comfortable headset with virtual 7.1 surround sound.'},
  {'icon': 'assets/monitor.png', 'title': 'Monitor', 'subtitle': 'Dell UltraSharp 27 4K', 'price': '\$449.99', 'description': 'Stunning 4K monitor with wide color coverage.'},
];

  // Add more items 



    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Row(
          children: [
            Image.asset('assets/logo.png', scale: 14),
            const SizedBox(width: 8),
            const Text(
              'HARDWARE',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Color(0xFF8A2BE2), 
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.cart),
            color: Color(0xFF8A2BE2), 
          ),
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(CupertinoIcons.arrow_right_to_line),
            color: Color(0xFF8A2BE2), 
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return _buildListItem(
              icon: item['icon'] as IconData,
              title: item['title'] as String,
              subtitle: item['subtitle'] as String,
              trailing: item['price'] as String,
              description: item['description'] as String,
            );
          },
        ),
      ),
    );
  }

  Widget _buildListItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String trailing,
    required String description,
  }) {
    return Card(
      color: Colors.white.withAlpha(230), 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), 
        side: BorderSide(color: Color(0xFF8A2BE2)), 
      ),
      child: ListTile(
        leading: Icon(icon, color: Color(0xFF8A2BE2)), 
        title: Text(title, style: TextStyle(color: Color(0xFF8A2BE2))), 
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subtitle, style: TextStyle(color: Color(0xFF8A2BE2))), 
            Text(description, style: TextStyle(fontSize: 12, color: Colors.grey.shade500)), 
          ],
        ),
        trailing: Text(
          trailing,
          style: TextStyle(
            color: Color(0xFF8A2BE2),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
