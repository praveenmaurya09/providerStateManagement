import 'package:flutter/material.dart';
import 'package:mvvm_management/data/response/status.dart';
import 'package:mvvm_management/utils/routes/routes_name.dart';
import 'package:mvvm_management/view_model/home_view_model.dart';
import 'package:mvvm_management/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {

    // TODO: implement initState
    homeViewModel.fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPreference =Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [

          InkWell(
            onTap: (){
              userPreference.remove().then((value) {
                Navigator.pushNamed(context, RoutesName.login);
              });
            },
            child: Text("Logout"),
          ),
          SizedBox(width: 25.0),
        ],
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context) => homeViewModel,
        child: Consumer<HomeViewModel>(
          builder: (context, value, _){
            switch(value.moviesList.status){
              case Status.LOADING:
                return CircularProgressIndicator();
              case Status.ERROR:
                return Text(value.moviesList.message.toString());
              case Status.COMPLETED:
                return Text('Hello');
            }
            return Container();
          }
        ),
      ),
    );
  }
}
