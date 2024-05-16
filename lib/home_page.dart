import 'package:flutter/material.dart';
//import 'database_helper.dart';
//import 'auth_provider.dart';
import 'package:flutter/cupertino.dart';

import 'package:firebase_auth/firebase_auth.dart';





class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Row(
          children: [
            Image.asset('assets/hardware_logo.png', scale: 14),
            const SizedBox(width: 8),
            const Text(
              'HARDWARE',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.cart)),
          IconButton(
            onPressed: () {
          //log out
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(CupertinoIcons.arrow_right_to_line),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.memory),
              title: Text('Processor'),
              subtitle: Text('Intel Core i7-9700K'),
              trailing: Text('\$299.99'),
            ),
            ListTile(
              leading: Icon(Icons.storage),
              title: Text('SSD'),
              subtitle: Text('Samsung 970 EVO 1TB'),
              trailing: Text('\$149.99'),
            ),
            ListTile(
              leading: Icon(Icons.sd_storage),
              title: Text('RAM'),
              subtitle: Text('Corsair Vengeance LPX 16GB'),
              trailing: Text('\$79.99'),
            ),
            ListTile(
              leading: Icon(Icons.computer),
              title: Text('Graphics Card'),
              subtitle: Text('NVIDIA GeForce RTX 3080'),
              trailing: Text('\$699.99'),
            ),
            ListTile(
              leading: Icon(Icons.power),
              title: Text('Power Supply'),
              subtitle: Text('Corsair RM750x 750W'),
              trailing: Text('\$119.99'),
            ),
            ListTile(
              leading: Icon(Icons.computer),
              title: Text('Motherboard'),
              subtitle: Text('ASUS ROG Strix Z390-E'),
              trailing: Text('\$249.99'),
            ),
        //to add more items
          ],
        ),
      ),
    );
  }
}




