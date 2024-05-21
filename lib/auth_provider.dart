import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'start.dart';

class AuthProvider extends ChangeNotifier {
  String? _currentUsername;

  String? get currentUsername => _currentUsername;

  Future<bool> login(BuildContext context, String username, String password) async {
    final db = await DatabaseHelper.instance.database;
    final res = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    bool loggedIn = res.isNotEmpty;
    if (loggedIn) {
      _currentUsername = username;
      notifyListeners();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => StartPage()),
      );
    }
    return loggedIn;
  }

  Future<void> register(String username, String email, String password) async {
    final db = await DatabaseHelper.instance.database;
    await db.insert('users', {
      'username': username,
      'email': email,
      'password': password,
    });
  }
}
