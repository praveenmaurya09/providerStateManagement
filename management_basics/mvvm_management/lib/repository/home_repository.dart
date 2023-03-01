
import 'package:mvvm_management/data/network/base_api_services.dart';
import 'package:mvvm_management/data/network/network_api_services.dart';
import 'package:mvvm_management/model/movies_model.dart';
import 'package:mvvm_management/res/app_url.dart';

class HomeRepository{

  BaseApiServices _apiServices = NetworkApiServices();

  Future<Movies> fetchMovies () async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.moviesUrl);
      return response = Movies.fromJson(response);
    }catch(e){
      throw e;
    }
  }

}