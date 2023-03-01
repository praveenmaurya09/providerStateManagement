
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_management/model/user_model.dart';
import 'package:mvvm_management/repository/auth_repository.dart';
import 'package:mvvm_management/utils/routes/routes_name.dart';
import 'package:mvvm_management/utils/utils.dart';
import 'package:mvvm_management/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier{

  bool _loading = false;
  bool get loading=> _loading;

  bool _signuploading = false;
  bool get singuploading=> _signuploading ;

  setLoading(bool value){
    _loading =value;
    notifyListeners();
  }

  setSingupLoading(bool value){
    _signuploading =value;
    notifyListeners();
  }

  final _myRepo = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async{
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      userPreference.saveUser(UserModel(
        token: value['token'].toString()
      ));
      Utils.flushBarErrorMessage("Login Successful", context);
      Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode){
        print(value.toString());
      }

    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if(kDebugMode){
        setSingupLoading(false);
        Utils.flushBarErrorMessage("Sing Up Successful", context);
        Navigator.pushNamed(context, RoutesName.home);
        if(kDebugMode){
          print(value.toString());
        }

      }).onError((error, stackTrace) {
      setSingupLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if(kDebugMode){
      print(error.toString());
      }

      });
    }
        print(error.toString());
      }

    });
  }

  Future<void> signupApi(dynamic data, BuildContext context) async{
    setSingupLoading(true);
    _myRepo.signupApi(data).then((value) {
}