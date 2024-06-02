import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_parsing/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  List dataList = [];

  jsonParsing() async{
    final jsonData = await rootBundle.loadString("assets/data.json");
    final dataMap = jsonDecode(jsonData);
    dataList = List.from(dataMap['heading']).map((item) => Heading.fromJson(item as Map<String, dynamic>)).toList();
  }

  @override
  void initState() {
    super.initState();
    jsonParsing();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (context, index){
            return Text(dataList[index].label);
          }
      )
    );
  }
}

/*
- create a data model class that provides the details of information to be stored and it is good practice
- load the json data using rootBundle.loadString()
- decode the the jsonData using jsonDecode()
- The code converts the JSON data to a list of objects using the fromJson method.
This is a good practice because it allows you to work with strongly-typed data models in your app, rather than raw JSON data.
- List.from() method is the best way to assign one list to other list.
* */