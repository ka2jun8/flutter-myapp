import 'package:flutter/material.dart';

class Page extends StatelessWidget {
  final Color color;
  final String title;

  Page({Key key, this.color, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }

}