import 'package:animate_do/animate_do.dart';
import 'package:app_flutter_test_users/core/utils/dictionary.dart';
import 'package:app_flutter_test_users/presentation/widgets/image_local_custom.dart';
import 'package:app_flutter_test_users/presentation/widgets/text_label_custom.dart';
import 'package:flutter/material.dart';

Widget viewEmpty(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: FadeIn(
      delay: const Duration(milliseconds: 400),
      duration: const Duration(milliseconds: 400),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 80,
                  height: 80,
                  child: imageLocalCustom(
                      context,
                      'ic_empty.png')
              ),
              const SizedBox(height: 20,),
              textLabelCustom(dictionary.viewEmpty, TextAlign.center, Colors.black87, 20, FontWeight.bold),
            ],
          ),
        ),
      ),
    ),
  );
}