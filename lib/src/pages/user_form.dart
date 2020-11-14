import 'package:crud/src/models/user.dart';
import 'package:crud/src/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(User user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final User user = ModalRoute.of(context).settings.arguments;
    _loadFormData(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Form(
          key: _form,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nome',
                ),
                onSaved: (value) => _formData['name'] = value,
                initialValue: _formData['name'],
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                onSaved: (value) => _formData['email'] = value,
                initialValue: _formData['email'],
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Url do Avatar',
                ),
                onSaved: (value) => _formData['avatarUrl'] = value,
                initialValue: _formData['avatarUrl'],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Container(
                  width: double.infinity,
                  child: FlatButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      _form.currentState.save();

                      Provider.of<UsersProvider>(
                        context,
                        listen: false,
                      ).put(User(
                        id: _formData['id'],
                        name: _formData['name'],
                        email: _formData['email'],
                        avatarUrl: _formData['avatarUrl'],
                      ));
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
