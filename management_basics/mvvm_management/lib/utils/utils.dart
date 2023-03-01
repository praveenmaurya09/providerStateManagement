
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String message){
    Fluttertoast.showToast(msg: message);
  }


  static void fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus){
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);

  }

  static void flushBarErrorMessage(String message, BuildContext context){
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          reverseAnimationCurve: Curves.easeInOut,
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          padding: EdgeInsets.all(15.0),
          message: message,
          backgroundColor: Colors.green,
          borderRadius: BorderRadius.circular(15.0),
          duration: Duration(seconds: 3),
          positionOffset: 20,
          flushbarPosition: FlushbarPosition.TOP,
          icon: Icon(Icons.error, size: 28, color: Colors.white,),
        )..show(context),
    );
  }


  static snackBar(String message, BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      )
    );
  }

}


