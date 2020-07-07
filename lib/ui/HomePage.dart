import 'package:flutter/material.dart';
import 'package:wanandroid/ui/ArticalPage.dart';
import 'package:wanandroid/ui/MinePage.dart';
import 'package:wanandroid/ui/ProjectPage.dart';
import 'package:wanandroid/utils/Strings.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentPos = 0;
  var _bodys = List<Widget>();

  @override
  void initState() {
    _bodys.add(ArticalPage());
    _bodys.add(ProjectPage());
    _bodys.add(MinePage());
  }

  @override
  Widget build(BuildContext context) {
    var bars = [
      BottomNavigationBarItem(
        icon: Image(
          width: 20,
          height: 20,
          image: AssetImage("images/artical_false.png"),
        ),
        activeIcon: Image(
          width: 20,
          height: 20,
          image: AssetImage("images/artical_true.png"),
        ),
        title: Text(Strings.artical),
      ),
      BottomNavigationBarItem(
        icon: Image(
          width: 20,
          height: 20,
          image: AssetImage("images/project_false.png"),
        ),
        activeIcon: Image(
          width: 20,
          height: 20,
          image: AssetImage("images/project_true.png"),
        ),
        title: Text(Strings.project),
      ),
      BottomNavigationBarItem(
        icon: Image(
          width: 20,
          height: 20,
          image: AssetImage("images/mine_false.png"),
        ),
        activeIcon: Image(
          width: 20,
          height: 20,
          image: AssetImage("images/mine_true.png"),
        ),
        title: Text(Strings.mine),
      ),
    ];
    return Scaffold(
      body: _bodys[_currentPos],
      bottomNavigationBar: BottomNavigationBar(
        items: bars,
        currentIndex: _currentPos,
        onTap: (i) {
          setState(() {
            _currentPos = i;
          });
        },
      ),
    );
  }
}
