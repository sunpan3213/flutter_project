import 'package:flutter/material.dart';
import 'package:wanandroid/utils/Strings.dart';

class ProjectPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(Strings.project),
    );
  }
}
