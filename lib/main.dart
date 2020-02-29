import 'package:flutter/material.dart';
import 'components/anchor.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("GridView"),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {

  List<Anchor> anchors = [];

  @override
  void initState() {
    getAnchors().then((value) {
      setState(() {
        this.anchors = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 1.0
        ),
        itemCount: anchors.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(anchors[index].imageUrl, fit: BoxFit.cover, width: 200, height: 140),
                SizedBox(height: 5),
                Text(anchors[index].title, style: TextStyle(fontSize: 18), maxLines: 1, overflow: TextOverflow.ellipsis),
                Text(anchors[index].description, maxLines: 1, overflow: TextOverflow.ellipsis)
              ],
            ),
          );
        },
      ),
    );
  }
}

class MyGridViewExtentWidget extends StatelessWidget {
  List<Widget> getGridWidgets() {
    return List.generate(100, (index) {
      return Container(
        color: Colors.purpleAccent,
        alignment: Alignment(0, 0),
        child: Text("item${index + 1}",
            style: TextStyle(fontSize: 20, color: Colors.white)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.0
      ),
      children: getGridWidgets(),
    );
  }
}



class MyGridViewWidget extends StatelessWidget {
  List<Widget> getGridWidgets() {
    return List.generate(100, (index) {
      return Container(
        color: Colors.purpleAccent,
        alignment: Alignment(0, 0),
        child: Text("item${index + 1}",
            style: TextStyle(fontSize: 20, color: Colors.white)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 1.0),
      children: getGridWidgets(),
    );
  }
}
