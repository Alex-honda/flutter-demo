import 'package:flutter/material.dart';

//main(List<String> args){
//  runApp(MyApp());
//}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("加减计数")),
        body: MyCounterWidget(),
      ),
    );
  }
}

class MyCounterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyCounterState();
  }
}

class MyCounterState extends State<MyCounterWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.redAccent,
                child: Text("-1",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                onPressed: () {
//                  print("点击了一下-按钮");
                  setState(() {
                    counter--;
                  });
                },
              ),
              RaisedButton(
                color: Colors.greenAccent,
                child: Text("+1",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                onPressed: () {
//                  print("点击了一下+按钮");
                  setState(() {
                    counter++;
                  });
                },
              )
            ],
          ),
          SizedBox(height: 10),
          Text("当前计数：$counter", style: TextStyle(fontSize: 30)),
        ],
      ),
    );
  }
}
