import 'package:app_flutter_test_users/core/utils/colors.dart';
import 'package:app_flutter_test_users/presentation/widgets/image_local_custom.dart';
import 'package:flutter/material.dart';

Widget buttonCircleCustom(
    BuildContext context,
    double size,
    Color color,
    String icon,
    Function function) {
  return InkWell(
    onTap: () {
      function();
    },
    child: Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
              color: ColorsCustom.shadowGray,
              blurRadius: 4.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, 4.0)),
        ],
      ),
      child: Center(
        child: imageLocalCustom(context, icon),
      ),
    ),
  );
}