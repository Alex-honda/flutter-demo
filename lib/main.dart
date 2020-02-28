import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("布局Widget"),
        ),
        body: MyHomeBody(),
      ),
    );
  }
}

class MyHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.purpleAccent,
          width: 300,
          height: 300,
        ),
        Positioned(
            left: 20,
            top: 20,
            child: Icon(Icons.favorite, size: 50, color: Colors.white)),
        Positioned(
            right: 20,
            bottom: 20,
            child: Text("你好啊！Alexandra",
                style: TextStyle(fontSize: 20, color: Colors.white)))
      ],
    );
  }
}

class MyColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child:
                    Container(color: Colors.redAccent, width: 60, height: 60)),
            Container(color: Colors.blueAccent, width: 80, height: 80),
            Container(color: Colors.orangeAccent, width: 70, height: 70),
            Expanded(
                child: Container(
                    color: Colors.greenAccent, width: 100, height: 100))
          ],
        ),
      ],
    );
  }
}

class MyRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
            child: Container(color: Colors.redAccent, width: 60, height: 60)),
        Container(color: Colors.blueAccent, width: 80, height: 80),
        Container(color: Colors.orangeAccent, width: 70, height: 70),
        Expanded(
            child:
                Container(color: Colors.greenAccent, width: 100, height: 100))
      ],
    );
  }
}

class MyCircleAvatarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: NetworkImage(
                    "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg"))),
      ),
    );
  }
}

class MyContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
//        color: Color.fromRGBO(3, 3, 255, .5),
        width: 100,
        height: 100,
        child: Icon(Icons.pets, size: 32, color: Colors.white),
        decoration: BoxDecoration(
            color: Colors.amber,
            border: Border.all(
                color: Colors.redAccent, width: 3, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  offset: Offset(5, 5), color: Colors.purple, blurRadius: 5)
            ],
//          shape: BoxShape.circle,
            gradient: LinearGradient(colors: [Colors.green, Colors.red])),
      ),
    );
  }
}

class MyPaddingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Text(
        "莫听穿林打叶声，何妨吟啸且徐行。竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
        style: TextStyle(color: Colors.redAccent, fontSize: 18),
      ),
    );
  }
}

class MyCenterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(Icons.pets, size: 36, color: Colors.red),
      widthFactor: 3,
      heightFactor: 3,
    );
  }
}

class MyAlignWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Icon(Icons.pets, size: 36, color: Colors.red),
      alignment: Alignment.bottomRight,
      widthFactor: 3,
      heightFactor: 3,
    );
  }
}
