import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wanandroid/test.dart';
import 'package:wanandroid/ui/LoginPage.dart';
import 'package:wanandroid/utils/LogUtils.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pushHome,
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Image(
                width: 200,
                height: 200,
                image: AssetImage('images/logo.png'),
                alignment: Alignment.topCenter,
              ),
              flex: 1,
            ),
            Expanded(
              child: Text(
                'v1.0.0',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    decoration: TextDecoration.none),
              ),
              flex: 0,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      _pushHome();
    });

//    var timer = Timer.periodic(Duration(seconds: 2), (timer) {
//      _pushHome();
//    });
//    Future.delayed(Duration(seconds: 2), () {
//      _pushHome();
//      timer.cancel();
//    });
  }

  void _pushHome() {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return LoginPage();
    }), (route) => route == null);
  }
}
