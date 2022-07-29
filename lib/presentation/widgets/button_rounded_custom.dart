import 'package:app_flutter_test_users/core/utils/colors.dart';
import 'package:app_flutter_test_users/presentation/widgets/text_label_custom.dart';
import 'package:flutter/material.dart';

Widget buttonCustom(
    BuildContext context,
    double width,
    String text,
    Color color,
    Color colorText,
    Function function) {
  return InkWell(
    onTap: () {
      function();
    },
    child: Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        boxShadow: const [
          BoxShadow(
              color: ColorsCustom.shadowGray,
              blurRadius: 4.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, 4.0)),
        ],
      ),
      child: Center(
        child: textLabelCustom(
            text,
            TextAlign.center,
            colorText,
            15,
            FontWeight.bold),
      ),
    ),
  );
}