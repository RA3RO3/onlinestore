import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'auth_provider.dart';

class CartProvider with ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];
  int? _userId;

  List<Map<String, dynamic>> get cartItems => _cartItems;

  CartProvider(AuthProvider authProvider) {
    _userId = authProvider.userId;
    _loadCartItems();
  }

  Future<void> _loadCartItems() async {
    if (_userId == null) return;

    final db = await DatabaseHelper.instance.database;
    final res = await db.query(
      'cart_items',
      where: 'user_id = ?',
      whereArgs: [_userId],
    );
    _cartItems = res.map((item) => {
      'name': item['name'],
      'price': item['price'],
    }).toList();
    notifyListeners();
  }

  Future<void> addItem(Map<String, dynamic> item) async {
    if (_userId == null) return;

    _cartItems.add(item);
    notifyListeners();

    final db = await DatabaseHelper.instance.database;
    await db.insert('cart_items', {
      'user_id': _userId,
      'name': item['name'],
      'price': item['price'],
    });
  }

  Future<void> removeItem(int index) async {
    if (_userId == null) return;

    final item = _cartItems[index];
    _cartItems.removeAt(index);
    notifyListeners();

    final db = await DatabaseHelper.instance.database;
    await db.delete(
      'cart_items',
      where: 'user_id = ? AND name = ? AND price = ?',
      whereArgs: [_userId, item['name'], item['price']],
    );
  }

  Future<void> clearCart() async {
    if (_userId == null) return;

    _cartItems.clear();
    notifyListeners();

    final db = await DatabaseHelper.instance.database;
    await db.delete(
      'cart_items',
      where: 'user_id = ?',
      whereArgs: [_userId],
    );
  }
}