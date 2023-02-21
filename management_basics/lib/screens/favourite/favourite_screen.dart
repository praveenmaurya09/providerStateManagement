import 'package:flutter/material.dart';
import 'package:management_basics/provider/favourite_provider.dart';
import 'package:management_basics/screens/favourite/myfavourite.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  List<int> selectedItem = [];
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite App"),
        actions: [
          InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MyFavouriteItemScreen()));
              },
              child: Icon(Icons.favorite)),
          SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(

              itemCount: 100,
              itemBuilder: (context, index){
                return Consumer<FavouriteProvider>(builder: (context, value, child){
                  return ListTile(

                    onTap: (){
                      if(value.selectedItem.contains(index)){
                        value.removeItem(index);
                      }else{
                        value.addItem(index);
                      }


                      print("inside the ListView");

                    },
                    title: Text('Item '+index.toString()),
                    trailing: Icon(value.selectedItem.contains(index)?Icons.favorite: Icons.favorite_outline),
                  );
                });
              }
            ),
          )
        ],
      ),
    );
  }
}
