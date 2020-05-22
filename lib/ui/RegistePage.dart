import 'package:flutter/cupertino.dart';

class RegistePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisteState();
}

class _RegisteState extends State<RegistePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Column(

      ),
    );
  }
}
