import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String? userId;
  String? userName;

  void selectUser({
    required String id,
    required String name,
  }) {
    userId = id;
    userName = name;
    notifyListeners();
  }
}