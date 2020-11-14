import 'dart:math';

import 'package:crud/src/data/dummy_users.dart';
import 'package:crud/src/models/user.dart';
import 'package:flutter/cupertino.dart';

class UsersProvider with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (user == null) {
      return;
    }

    final id = Random().nextDouble().toString();

    _items.putIfAbsent(
      id,
      () => User(
        id: id,
        name: user.name,
        email: user.email,
        avatarUrl: user.avatarUrl,
      ),
    );

    notifyListeners();
  }
}
