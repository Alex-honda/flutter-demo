import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Slivers"),
        ),
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return showCustomScrollView();
  }

  Widget showCustomScrollView() {
    return new CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Alexandra"),
            background: Image(
              image: NetworkImage(
                  "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        new SliverGrid(
          gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0),
          delegate:
              new SliverChildBuilderDelegate((BuildContext context, int index) {
            return new Container(
              alignment: Alignment(0, 0),
              color: Colors.teal[100 * (index % 9)],
              child: new Text("grid item $index"),
            );
          }, childCount: 10),
        ),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate:
              new SliverChildBuilderDelegate((BuildContext context, int index) {
            return new Container(
              alignment: Alignment.center,
              color: Colors.lightBlue[100 * (index % 9)],
              child: Text("list item $index"),
            );
          }, childCount: 20),
        )
      ],
    );
  }
}

class BasicSlivers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverSafeArea(
          sliver: SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  alignment: Alignment(0, 0),
                  color: Colors.orange,
                  child: Text("item${index + 1}"),
                );
              }, childCount: 50),
            ),
          ),
        )
      ],
    );
  }
}
