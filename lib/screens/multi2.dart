import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:split_view/split_view.dart';

class MyHomePage1 extends StatefulWidget {
  @override
  _MyHomePage1State createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyHomePage1"),
      ),
      body: SplitView(
        initialWeight: 0.7,
        view1: SplitView(
          viewMode: SplitViewMode.Horizontal,
          view1: Container(
            child: Center(
                child: Image.asset("assets/images/1.jpg",height: MediaQuery.of(context).size.height,fit: BoxFit.cover,),
                ),
            color: Color.fromRGBO(151, 99, 117, 1),
          ),
          view2: Container(
            child: Center(child: Text("View2")),
            color: Colors.blue,
          ),
          onWeightChanged: (w) => print("Horizon: $w"),
        ),
        view2: Container(
          child: Center(
            child: Text("View3"),
          ),
          color: Colors.green,
        ),
        viewMode: SplitViewMode.Vertical,
        onWeightChanged: (w) => print("Vertical $w"),
      ),
    );
  }
}
