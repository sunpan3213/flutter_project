import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wanandroid/SplashPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return OKToast(
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.black,
          textTheme: TextTheme(
            subhead: TextStyle(color: Colors.red),
          ),
        ),
        home: SplashPage(),
      ),
    );
  }
}
