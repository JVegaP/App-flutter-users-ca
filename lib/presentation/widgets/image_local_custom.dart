import 'package:flutter/material.dart';

Widget imageLocalCustom(BuildContext context, String image) {
  return Image(
      fit: BoxFit.cover,
      image: AssetImage('assets/images/$image')
  );
}