import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wanandroid/net/NetUtils.dart';
import 'package:wanandroid/ui/HomePage.dart';
import 'package:wanandroid/ui/RegistePage.dart';
import 'package:wanandroid/utils/Strings.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  FocusNode _accountFocusNode, _pwdFocusNode;
  TextEditingController _accountController, _pwdController;

  @override
  void initState() {
    super.initState();
    _accountFocusNode = FocusNode();
    _pwdFocusNode = FocusNode();
    _accountController = TextEditingController();
    _pwdController = TextEditingController();
  }

  Widget _topImage() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 50, 0, 20),
      child: Image.asset(
        "images/logo.png",
        width: 150,
        height: 150,
      ),
    );
  }

  Widget _accountTextField() {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: TextField(
        focusNode: _accountFocusNode,
        controller: _accountController,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              _accountController.clear();
            },
          ),
          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          hintText: Strings.loginAccountHint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(),
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        onSubmitted: (value) {
          _accountFocusNode.unfocus();
          FocusScope.of(context).requestFocus(_pwdFocusNode);
        },
      ),
    );
  }

  Widget _pwdTextField() {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 10, 30, 0),
      child: TextField(
        obscureText: true,
        focusNode: _pwdFocusNode,
        controller: _pwdController,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              _pwdController.clear();
            },
          ),
          prefixIcon: Icon(Icons.lock),
          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          hintText: Strings.loginPwdHint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(),
          ),
        ),
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.fromLTRB(30, 50, 30, 0),
      child: MaterialButton(
        onPressed: () {
          _login();
        },
        child: Text(
          Strings.loginButtonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        color: Colors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: Colors.blue,
            )),
      ),
    );
  }

  Widget _registeButton() {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: FlatButton(
        child: Text(Strings.registe),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return RegistePage();
            }),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: _topImage(),
              flex: 0,
            ),
            Expanded(
              child: _accountTextField(),
              flex: 0,
            ),
            Expanded(
              child: _pwdTextField(),
              flex: 0,
            ),
            Expanded(
              child: _loginButton(),
              flex: 0,
            ),
            Expanded(
              child: Container(),
              flex: 1,
            ),
            Expanded(
              child: _registeButton(),
              flex: 0,
            ),
          ],
        ),
        resizeToAvoidBottomInset: false,
      ),
    );
  }

  void _login() {
    NetUtils.instance.login(_accountController.text, _pwdController.text, (loginEntity) {
      showToast(Strings.loginSuccess);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (buildContext) {
        return HomePage();
      }), (route) => route == null);
    }, (msg) {
      showToast(msg);
    });
  }
}
