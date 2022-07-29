import 'package:app_flutter_test_users/presentation/widgets/text_label_custom.dart';
import 'package:flutter/material.dart';

Widget buttonTabSlider(
    BuildContext context,
    String text,
    bool isActive,
    Function function
    ) {
  return InkWell(
    onTap: () {
      function();
    },
    child: Padding(
      padding: const EdgeInsets.only(right: 20),
      child: SizedBox(
        width: 65,
        child: Column(
          children: [
            Center(
              child: Container(
                width: 60,
                height: 1,
                color: isActive ? Colors.black38 : Colors.transparent,
              ),
            ),
            const SizedBox(height: 5),
            Center(
              child: textLabelCustom(
                  text,
                  TextAlign.center,
                  isActive ? Colors.black87 : Colors.black38,
                  15,
                  FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}