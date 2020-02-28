import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:async';

class Anchor {
  String name;
  int age;
  String sex;

  Anchor({this.name, this.age, this.sex});

  Anchor.withMap(Map<String, dynamic> parsedMap) {
    print(parsedMap);
    this.name = parsedMap["name"];
    this.age = parsedMap["age"];
    this.sex = parsedMap["sex"];
  }
}

Future<List<Anchor>> getAnchors() async {
  // 1.读取json文件
  String jsonString = await rootBundle.loadString("assets/json/data.json");

  // 2.转成List或Map类型
  final jsonResult = json.decode(jsonString);

  // 3.遍历List，并且转成Anchor对象放到另一个List中
  List<Anchor> anchors = new List();
  for (Map<String, dynamic> map in jsonResult['data']) {
    anchors.add(Anchor.withMap(map));
  }
  return anchors;
}
