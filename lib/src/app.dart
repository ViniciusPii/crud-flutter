import 'package:crud/src/pages/home.dart';
import 'package:crud/src/pages/user_form.dart';
import 'package:crud/src/provider/users.dart';
import 'package:crud/src/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => UsersProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoutes.HOME: (_) => Home(),
          AppRoutes.USER_FORM: (_) => UserForm(),
        },
      ),
    );
  }
}
