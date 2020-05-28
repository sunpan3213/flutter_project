import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wanandroid/model/registe_entity.dart';
import 'package:wanandroid/net/NetUtils.dart';
import 'package:wanandroid/utils/Strings.dart';

import 'HomePage.dart';

class RegistePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisteState();
}

class _RegisteState extends State<RegistePage> {
  FocusNode _accountFocusNode, _pwdFocusNode, _rePwdFocusNode;
  TextEditingController _accountController, _pwdController, _rePwdController;

  @override
  void initState() {
    super.initState();
    _accountFocusNode = FocusNode();
    _pwdFocusNode = FocusNode();
    _rePwdFocusNode = FocusNode();
    _accountController = TextEditingController();
    _pwdController = TextEditingController();
    _rePwdController = TextEditingController();
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
          hintText: Strings.registeAccountHint,
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
          hintText: Strings.registePwdHint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(),
          ),
        ),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        onSubmitted: (value) {
          _pwdFocusNode.unfocus();
          FocusScope.of(context).requestFocus(_rePwdFocusNode);
        },
      ),
    );
  }

  Widget _rePwdTextField() {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 10, 30, 0),
      child: TextField(
        obscureText: true,
        focusNode: _rePwdFocusNode,
        controller: _rePwdController,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              _rePwdController.clear();
            },
          ),
          prefixIcon: Icon(Icons.lock),
          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          hintText: Strings.registeRePwdHint,
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

  Widget _registeButton() {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.fromLTRB(30, 50, 30, 0),
      child: MaterialButton(
        onPressed: () {
          _registe();
        },
        child: Text(
          Strings.registeButtonText,
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _topImage(),
              _accountTextField(),
              _pwdTextField(),
              _rePwdTextField(),
              _registeButton(),
            ],
          ),
        ),
      ),
    );
  }

  void _registe() {
    NetUtils.instance.registe(_accountController.text, _pwdController.text, (registeEntity) {
      showToast(Strings.registeSuccess);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (buildContext) {
        return HomePage();
      }), (route) => route == null);
    }, (errorMsg) {
      showToast(errorMsg);
    });
  }
}
