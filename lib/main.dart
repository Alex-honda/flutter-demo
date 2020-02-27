import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("基础Widget"),
        ),
        body: MyHomeBody(),
      ),
    );
  }
}

class MyHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Center(
        child: FormDemo(),
      ),
    );
  }
}

class FormDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FormDemoState();
}

class FormDemoState extends State<FormDemo> {
  final registerFormKey = GlobalKey<FormState>();

  String username, password;

  void registerForm() {
    registerFormKey.currentState.save();
    registerFormKey.currentState.validate();

    print("username:$username, password:$password");
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration:
                InputDecoration(icon: Icon(Icons.people), labelText: "请输入用户名"),
            onSaved: (value) => this.username = value,
            validator: (value) {
              if(value.isEmpty) {
                return "用户名不能为空";
              }
              return null;
            },
            autovalidate: true,
          ),
          TextFormField(
            obscureText: true,
            decoration:
                InputDecoration(icon: Icon(Icons.lock), labelText: "请输入密码"),
            onSaved: (value) => this.password = value,
            validator: (value) {
              if(value.isEmpty) {
                return "密码不能为空";
              }
              return null;
            },
            autovalidate: true,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 44,
            child: RaisedButton(
              color: Colors.blueAccent,
              child: Text(
                "注册",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onPressed: registerForm,
            ),
          )
        ],
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  TextFieldDemoState createState() => TextFieldDemoState();
}

class TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    /// 设置默认值
    textEditingController.text = "Hello World";

    /// 监听文本框
    textEditingController.addListener(
        () => print("textEditingController:${textEditingController.text}"));
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          icon: Icon(Icons.people),
          labelText: "username",
          labelStyle: TextStyle(color: Colors.white),
          hintText: "请输入用户名",
          hintStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.pinkAccent),
      onChanged: (value) => print("onChanged:$value"),
      onSubmitted: (value) => print("onSubmitted:$value"),
    );
  }
}

class MyClipRRectWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg",
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}

class MyClipOvalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: Image.network(
          "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg",
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}

class MyCircleAvatarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 100,
        backgroundImage: NetworkImage(
            "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg"),
        child: Container(
          alignment: Alignment(0, .5),
          width: 200,
          height: 200,
          child: Text("兵长利威尔"),
        ),
      ),
    );
  }
}

class MyLocalImageWidge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: FractionalOffset.center,
      width: 750,
      height: 800,
      color: Colors.yellowAccent,
      child: Image.asset("assets/images/yuqi.jpeg"),
    );
  }
}

class MyWebImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        "http://img0.dili360.com/ga/M01/48/3C/wKgBy1kj49qAMVd7ADKmuZ9jug8377.tub.jpg",
        repeat: ImageRepeat.noRepeat,
        alignment: Alignment.topCenter,
        fit: BoxFit.cover,
      ),
      width: 500,
      height: 300,
      color: Colors.yellow,
    );
  }
}

class MyButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              child: Text("FloatingActionButton"),
              onPressed: () {
                print("FloatingActionButton click");
              },
            ),
            RaisedButton(
              child: Text("RaisedButton"),
              color: Colors.blueAccent,
              textColor: Colors.white,
              highlightColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              onPressed: () {
                print("RaisedButton click");
              },
            ),
            FlatButton(
              child: Text("FlatButton"),
              onPressed: () {
                print("FlatButton click");
              },
            ),
            OutlineButton(
              child: Text("OutlineButton"),
              textColor: Colors.orangeAccent,
              borderSide: BorderSide(width: 5.0, style: BorderStyle.solid),
              onPressed: () {
                print("OutlineButton click");
              },
            )
          ],
        ),
      ],
    );
  }
}

class MyRichTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.center,
      child: Text.rich(
        TextSpan(children: [
          TextSpan(
              text: "《定风波》",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          TextSpan(
              text: "苏轼",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.redAccent)),
          TextSpan(
              text: "\n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black38)),
        ]),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class MyTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "《定风波》 苏轼 \n 莫听穿林打叶声，何妨吟啸且徐行。竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
      style: TextStyle(fontSize: 20, color: Colors.purple),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
