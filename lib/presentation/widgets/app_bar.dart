import 'package:animate_do/animate_do.dart';
import 'package:app_flutter_test_users/core/utils/colors.dart';
import 'package:app_flutter_test_users/presentation/widgets/image_local_custom.dart';
import 'package:flutter/material.dart';

Widget appBar(BuildContext context, bool viewBack, bool viewSave, Function save) {
  return Container(
    height: 60, width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.only(left: 15, right: 15),
    decoration: const BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
            color: ColorsCustom.shadowBlack,
            blurRadius: 4.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 4.0)),
      ],
    ),
    child: Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Stack(
            children: [
              Visibility(
                visible: viewBack,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                      onTap: (){ Navigator.of(context).pop({'update' : true});},
                      child: FadeInLeft(
                          delay: const Duration(milliseconds: 150),
                          duration: const Duration(milliseconds: 350),
                          child: const Icon(Icons.arrow_back_ios, color: Colors.blueAccent, size: 20))
                  ),
                ),
              ),
              Center(
                child: FadeIn(
                  delay: const Duration(milliseconds: 150),
                  duration: const Duration(milliseconds: 350),
                  child: SizedBox(
                    height: 60,
                    child: imageLocalCustom(
                        context,
                        'logo_footer_mini_home.png'
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: viewSave,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                      onTap: (){
                        save();
                      },
                      child: FadeInLeft(
                          delay: const Duration(milliseconds: 150),
                          duration: const Duration(milliseconds: 350),
                          child: const Icon(Icons.save, color: Colors.blueAccent, size: 20))
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}