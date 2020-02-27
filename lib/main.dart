import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title: Text("商品列表")), body: HomeContent()),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          ProductItem("Apple1", "Macbook1",
              "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
          ProductItem("Apple2", "Macbook2",
              "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg"),
          ProductItem("Apple3", "Macbook3",
              "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg")
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imgUrl;

  ProductItem(this.title, this.subTitle, this.imgUrl);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.blueAccent, width: 3.0, style: BorderStyle.solid)),
      child: Column(children: <Widget>[
        Text(title, style: TextStyle(fontSize: 24)),
        Text(subTitle, style: TextStyle(fontSize: 18)),
        SizedBox(height: 20),
        Image.network(imgUrl),
      ]),
    );
  }
}
