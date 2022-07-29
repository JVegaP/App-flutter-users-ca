import 'package:app_flutter_test_users/domain/entities/users/user.dart';
import 'package:app_flutter_test_users/presentation/widgets/text_label_custom.dart';
import 'package:flutter/material.dart';

Widget itemUser(BuildContext context, User item) {
  return Column(
    children: [
      const SizedBox(height: 10),
      Row(
        children: [
          SizedBox(
              height: 100,
              width: 100,
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 100, width: 100,
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        child: Stack(
                          children: [
                            const Center(
                              child: Image(
                                image: AssetImage('assets/images/ic_empty.png'),
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,),
                            ),
                            FadeInImage.assetNetwork(
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                              placeholderScale: 0.5,
                              placeholder: '',
                              image: item.avatar,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 100,
              decoration: const BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textLabelCustom('${item.firstName} ${item.lastName}', TextAlign.start, Colors.black87, 16, FontWeight.bold),
                      const SizedBox(height: 5),
                      textLabelCustom(item.email, TextAlign.start, Colors.black54, 14, FontWeight.normal),
                      const SizedBox(height: 5),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
    ],
  );
}