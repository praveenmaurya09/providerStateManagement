import 'package:flutter/material.dart';
import 'package:management_basics/provider/auth_provider.dart';
import 'package:management_basics/provider/count_provider.dart';
import 'package:management_basics/provider/example_one_provider.dart';
import 'package:management_basics/provider/favourite_provider.dart';
import 'package:management_basics/provider/themes_provider.dart';
import 'package:management_basics/screens/count_example.dart';
import 'package:management_basics/screens/example_one.dart';
import 'package:management_basics/screens/favourite/favourite_screen.dart';
import 'package:management_basics/screens/login_screen.dart';
import 'package:management_basics/screens/themes_screen.dart';
import 'package:management_basics/screens/value_notify_listner.dart';
import 'package:management_basics/why_provider.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';

void main() {
  runApp(
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers: [
        // ChangeNotifierProvider(create: (_) => CountProvider(),),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider(),),
        ChangeNotifierProvider(create: (_) => FavouriteProvider(),),
        ChangeNotifierProvider(create: (_) => ThemeChangerProvider(),),
        ChangeNotifierProvider(create: (_) => AuthProvider(),),
    ],
        child: Builder(
          builder: (BuildContext context){
            final themeChanger = Provider.of<ThemeChangerProvider>(context);
            return MaterialApp(
              title: "State Management",
              themeMode: themeChanger.themeMode,
              theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.red,
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.blue,
                appBarTheme: AppBarTheme( color: Colors.cyan,
                )
              ),

              home: LoginScreen(),
            );
          },
        )

    );
  }
}

