import 'package:flutter/material.dart';
import 'package:wanandroid/utils/Strings.dart';

class ArticalPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ArticalPageState();

}

class _ArticalPageState extends State<ArticalPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(Strings.artical),
    );
  }

}