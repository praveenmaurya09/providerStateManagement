
import 'package:flutter/cupertino.dart';
import 'package:mvvm_management/data/response/api_response.dart';
import 'package:mvvm_management/model/movies_model.dart';
import 'package:mvvm_management/repository/home_repository.dart';

class HomeViewModel with ChangeNotifier {

  final _myRepo = HomeRepository();

  ApiResponse<MoviesModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MoviesModel> response){
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMovies() async{
    setMoviesList(ApiResponse.loading());

    _myRepo.fetchMovies().then((value) {

      setMoviesList(ApiResponse.completed(value as MoviesModel?));

    }).onError((error, stackTrace){
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}