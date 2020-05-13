import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wanandroid/utils/LogUtils.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<SplashPage> {
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
                '1.0.0',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              flex: 0,
            ),
          ],
        ),
      ),
    );
  }

  void _pushHome() {
    LogUtils.e('click');
    showToast("click${Random().nextInt(100)}");
//    Navigator.pushAndRemoveUntil(context, newRoute, predicate)
  }
}