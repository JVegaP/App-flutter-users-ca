import 'package:flutter/material.dart';

Widget backgroundHome(BuildContext context, Color background, double height) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height*height,
    decoration: BoxDecoration(
      color: background
    ),
  );
}