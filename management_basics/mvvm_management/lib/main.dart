import 'package:flutter/material.dart';
import 'package:mvvm_management/utils/routes/routes.dart';
import 'package:mvvm_management/utils/routes/routes_name.dart';
import 'package:mvvm_management/view/login_view.dart';
import 'package:mvvm_management/view_model/auth_view_model.dart';
import 'package:mvvm_management/view_model/home_view_model.dart';
import 'package:mvvm_management/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider(create: (_) => AuthViewModel()),
          ChangeNotifierProvider(create: (_) => UserViewModel()),
          // ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}

