import 'package:crud/src/components/user_tile.dart';
import 'package:crud/src/data/dummy_users.dart';
import 'package:crud/src/models/user.dart';
import 'package:crud/src/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UsersProvider users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(user: users.byIndex(i)),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            users.put(User(
              id: '20',
              name: 'Vinicius',
              email: 'bla@bla',
              avatarUrl: '',
            ));
          }),
    );
  }
}
