import 'package:flutter/material.dart';
import 'package:wanandroid/utils/Strings.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(Strings.mine),
    );
  }
}
