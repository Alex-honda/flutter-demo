import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("NotificationListener"),
        ),
        body: MyHomeNotificationDemo(),
      ),
    );
  }
}

class MyHomeNotificationDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomeNotificationDemoState();
  }
}

class MyHomeNotificationDemoState extends State<MyHomeNotificationDemo> {
  int _progress = 0;

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification notification) {
        /*判断监听事件的类型*/
        if(notification is ScrollStartNotification) {
          print("开始滚动....");
        } else if (notification is ScrollUpdateNotification) {
          /*当前的位置和总长度*/
          final currentPixel = notification.metrics.pixels;
          final totalPixel = notification.metrics.maxScrollExtent;
          double progress = currentPixel / totalPixel;
          setState(() {
            _progress = (progress * 100).toInt();
          });
          print("正在滚动${notification.metrics.pixels} - ${notification.metrics.maxScrollExtent}");
        } else if(notification is ScrollEndNotification) {
          print("结束滚动....");
        }
        return false;
      },
      child: Stack(
        alignment: Alignment(0.9, 0.9),
        children: <Widget>[
          ListView.builder(
            itemCount: 100,
            itemExtent: 60,
            itemBuilder: (BuildContext context, int index){
              return ListTile(title: Text("item$index"));
            },
          ),
          CircleAvatar(
            radius: 30,
            child: Text("$_progress%"),
            backgroundColor: Colors.black54,
          )
        ],
      ),
    );
  }
}








class MyScrollController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyScrollController> {
  ScrollController _controller;
  bool _isShowTop = false;

  @override
  void initState() {
    // 初始化ScrollController
    _controller = ScrollController();

    // 监听滚动
    _controller.addListener(() {
      var tempSsShowTop = _controller.offset >= 1000;
      if (tempSsShowTop != _isShowTop) {
        setState(() {
          _isShowTop = tempSsShowTop;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("监听滚动事件"),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemExtent: 60,
        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("item$index"));
        },
      ),
      floatingActionButton: !_isShowTop
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(0,
                    duration: Duration(milliseconds: 1000), curve: Curves.ease);
              }),
    );
  }
}
