

import 'package:flutter/material.dart';
import 'package:mvvm_management/utils/routes/routes_name.dart';
import 'package:mvvm_management/view/home_screen.dart';
import 'package:mvvm_management/view/login_view.dart';
import 'package:mvvm_management/view/signup_view.dart';
import 'package:mvvm_management/view/splash_view.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){

      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => SplashView());


      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => HomeScreen());

      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => LoginView());

      case RoutesName.signup:
        return MaterialPageRoute(builder: (BuildContext context) => SignUpView());


      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text("No Route Define"),
            ),
          );
        });
    }
  }
}