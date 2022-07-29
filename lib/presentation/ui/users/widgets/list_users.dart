import 'package:app_flutter_test_users/domain/entities/users/user.dart';
import 'package:app_flutter_test_users/presentation/ui/users/widgets/item_loading.dart';
import 'package:app_flutter_test_users/presentation/ui/users/widgets/item_user.dart';
import 'package:app_flutter_test_users/presentation/widgets/view_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

Widget listUsers(BuildContext context, List<User> users, Function function) {
  return users.isEmpty ? viewEmpty(context) : AnimationLimiter(
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: users.isEmpty ? 10 : users.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index){
          return AnimationConfiguration.staggeredList(
              position: index,
              delay: const Duration(milliseconds: 100),
              duration: const Duration(milliseconds: 350),
              child: SlideAnimation(
                  verticalOffset: 50.0,
                  curve: Curves.decelerate,
                  child: FadeInAnimation(
                    child: users.isEmpty? itemLoading():
                    InkWell(onTap:(){
                      function(users[index]);
                    },
                        child: itemUser(context, users[index])
                    ),
                  )
              )
          );
        },
      )
  );
}