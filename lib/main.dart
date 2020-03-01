import 'package:flutter/material.dart';
import 'components/starRating.dart';
import 'components/dashedLine.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("评分"),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DashedLine(
          axis: Axis.horizontal,
          count: 20,
          dashedWidth: 10,
          dashedHeight: 1,
      ),
    );
  }
}
