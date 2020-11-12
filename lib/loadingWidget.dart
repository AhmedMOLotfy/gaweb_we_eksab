import 'package:flutter/material.dart';

Widget myWidget(BuildContext context) {
  return Container(
    color: Colors.white,
    width: double.infinity,
    height: double.infinity,
    child: Center(
      child: CircularProgressIndicator(
        value: 22.0,
        //  backgroundColor: Colors.blueAccent,
      ),
    ),
  );
}
