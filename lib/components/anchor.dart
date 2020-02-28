import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:async';

class Anchor {
  String title;
  String description;
  String imageUrl;

  Anchor({this.title, this.description, this.imageUrl});

  Anchor.withMap(Map<String, dynamic> parsedMap) {
    this.title = parsedMap["title"];
    this.description = parsedMap["description"];
    this.imageUrl = parsedMap["imageUrl"];
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
