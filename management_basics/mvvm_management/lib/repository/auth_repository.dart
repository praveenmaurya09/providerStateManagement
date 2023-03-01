
import 'package:mvvm_management/data/network/base_api_services.dart';
import 'package:mvvm_management/data/network/network_api_services.dart';
import 'package:mvvm_management/res/app_url.dart';

class AuthRepository{

    BaseApiServices _apiServices = NetworkApiServices();

    Future<dynamic> loginApi(dynamic data) async{
      try{
        dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginUrl, data);
        return response;
      }catch(e){
        throw e;
      }

    }

    Future<dynamic> signupApi(dynamic data) async{
      try{
        dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerUrl, data);
        return response;
      }catch(e){
        throw e;
      }

    }
}
