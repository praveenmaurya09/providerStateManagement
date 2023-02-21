import 'package:flutter/material.dart';
import 'package:management_basics/provider/example_one_provider.dart';
import 'package:provider/provider.dart';

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({Key? key}) : super(key: key);

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  double value = 1.0;
  @override
  Widget build(BuildContext context) {
    print("build");
    // final provider = Provider.of<ExampleOneProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Example One"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(builder: (context,value,child){
            print("Build Again");
            return Slider(
                min: 0,
                max: 1,
                value: value.value, onChanged: (val){
              value.setValue(val);
            });
          }),
          Consumer<ExampleOneProvider>(builder: (context,value,child){
            return Row(
              children: [
                Expanded(
                  child: Container(
                    child: Text("Container 1"),
                    color: Colors.green.withOpacity(value.value),
                    height: 50.0,
                    alignment: Alignment.center,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text("Container 2"),
                    color: Colors.red.withOpacity(value.value),
                    height: 50.0,
                    alignment: Alignment.center,
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
