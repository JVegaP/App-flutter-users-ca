import 'package:animate_do/animate_do.dart';
import 'package:app_flutter_test_users/core/utils/colors.dart';
import 'package:app_flutter_test_users/core/utils/dictionary.dart';
import 'package:app_flutter_test_users/core/utils/routes.dart';
import 'package:app_flutter_test_users/core/utils/utils.dart';
import 'package:app_flutter_test_users/presentation/ui/home/widgets/background_home.dart';
import 'package:app_flutter_test_users/presentation/ui/home/widgets/button_tab_slider.dart';
import 'package:app_flutter_test_users/presentation/widgets/button_circle_custom.dart';
import 'package:app_flutter_test_users/presentation/widgets/button_rounded_custom.dart';
import 'package:app_flutter_test_users/presentation/widgets/image_local_custom.dart';
import 'package:app_flutter_test_users/presentation/widgets/text_label_custom.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Home createState()=> Home();
}

class Home extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                Stack(
                  children: [
                    //Background
                    Column(
                      children: [
                        backgroundHome(context, ColorsCustom.greenLight, 0.9),
                        backgroundHome(context, ColorsCustom.purpleLight, 1.3),
                        backgroundHome(context, ColorsCustom.blueLight, 0.7)
                      ],
                    ),
                    Column(
                      children: [
                        //Header
                        header(),
                        //Body
                        body(),
                        //Footer
                        footer()
                      ],
                    )
                  ],
                )
              ],
            ),
          ],
        )
      ),
    );
  }

  Widget header() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 50),
                BounceInDown(
                  delay: const Duration(milliseconds: 350),
                  duration: const Duration(milliseconds: 500),
                  child: imageLocalCustom(
                      context,
                      "logo_header_home.png"
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 70,
                  height: 1,
                  color: Colors.black38,
                ),
                const SizedBox(height: 20),
                FadeIn(
                  delay: const Duration(milliseconds: 250),
                  duration: const Duration(milliseconds: 500),
                  child: textLabelCustom(
                      dictionary.titleHome, TextAlign.center, Colors.black87, 30, FontWeight.bold),
                ),
                const SizedBox(height: 20),
                FadeIn(
                  delay: const Duration(milliseconds: 250),
                  duration: const Duration(milliseconds: 500),
                  child: textLabelCustom(
                      dictionary.titleMessageHome, TextAlign.center, Colors.black45, 15, FontWeight.normal),
                ),
                const SizedBox(height: 20),
                FadeInUp(
                  delay: const Duration(milliseconds: 250),
                  duration: const Duration(milliseconds: 500),
                  child: buttonCustom(
                      context, 140, dictionary.getTouch, Colors.white, ColorsCustom.blueLight, _openEmail),
                ),
                FadeIn(
                  delay: const Duration(milliseconds: 500),
                  duration: const Duration(milliseconds: 500),
                  child: imageLocalCustom(
                      context,
                      "logo_body_home.png"
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0,
              top: MediaQuery.of(context).size.height * 0.86,
              child: SlideInRight(
                delay: const Duration(milliseconds: 500),
                duration: const Duration(milliseconds: 300),
                child: buttonCircleCustom(
                    context,
                    60,
                    Colors.white,
                    'ic_menu.png',
                    _openUsers
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Align(
                alignment: Alignment.centerLeft,
                child: textLabelCustom(
                    dictionary.caseStudies,
                    TextAlign.start,
                    Colors.white, 18,
                    FontWeight.bold
                )
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 70,
                height: 1,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          slider(),

        ],
      ),
    );
  }

  Widget footer() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            const SizedBox(height: 50),

            Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: imageLocalCustom(
                        context,
                        "logo_footer_home.png"
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(height: 100),
                      textLabelCustom(dictionary.titleFooter, TextAlign.center, Colors.white, 24, FontWeight.bold),
                      const SizedBox(height: 30),
                      buttonCustom(context, 140, dictionary.getTouch, Colors.white, ColorsCustom.blueLight, _openEmail),
                      const SizedBox(height: 50),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 70,
                          height: 1,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      imageLocalCustom(
                          context,
                          "logo_footer_mini_home.png"
                      ),
                      const SizedBox(height: 20),
                      textLabelCustom(dictionary.bogota, TextAlign.right, Colors.white, 14, FontWeight.bold),
                      textLabelCustom(dictionary.addressBogota, TextAlign.right, Colors.white, 14, FontWeight.normal),
                      const SizedBox(height: 15),
                      textLabelCustom(dictionary.ukraine, TextAlign.right, Colors.white, 14, FontWeight.bold),
                      textLabelCustom(dictionary.addressUkraine, TextAlign.right, Colors.white, 14, FontWeight.normal),
                      const SizedBox(height: 15),
                      textLabelCustom(dictionary.usa, TextAlign.right, Colors.white, 14, FontWeight.bold),
                      textLabelCustom(dictionary.addressUsa, TextAlign.right, Colors.white, 14, FontWeight.normal),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 70,
                          height: 1,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      textLabelCustom(dictionary.allRights, TextAlign.right, Colors.white, 14, FontWeight.normal),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget slider() {
    return Column(
      children: [
        Row(
          children: [
            buttonCircleCustom(
                context,
                30,
                Colors.white,
                'ic_back.png',
                _backSlider
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: ColorsCustom.purpleCreamLight,
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  boxShadow: [
                    BoxShadow(
                        color: ColorsCustom.shadowBlack,
                        blurRadius: 4.0,
                        spreadRadius: 2.0,
                        offset: Offset(2.0, 4.0)),
                  ],
                ),
                child: Column(
                  children: [
                    imageLocalCustom(
                        context,
                        "img_slider_home.png"
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          textLabelCustom(dictionary.titleSlider, TextAlign.start, Colors.black87, 28, FontWeight.bold),
                          const SizedBox(height: 15),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 70,
                              height: 1,
                              color: Colors.black45,
                            ),
                          ),
                          const SizedBox(height: 15),
                          textLabelCustom(dictionary.messageSlider, TextAlign.justify, Colors.black87, 11, FontWeight.normal),
                          const SizedBox(height: 15),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: buttonCustom(context, 140, dictionary.titleButtonSlider, Colors.white, ColorsCustom.blueLight, _openUsers)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(width: 15),
            buttonCircleCustom(
                context,
                30,
                Colors.white,
                'ic_next.png',
                _nextSlider
            ),
          ],
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: SizedBox(
              height: 80,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index){
                    var itemKey = dictionary.options.keys.elementAt(index);
                    var itemValue = dictionary.options.values.elementAt(index);
                    return buttonTabSlider(context, itemKey, itemValue, _nextSlider);
                  }
              ),
            ),
          ),
        )
      ],
    );
  }

  /// Method open provider email
  _openEmail() async{
    utils.openEmail();
  }

  /// Method for back slider
  _backSlider() {
  }

  /// Method for next slider
  _nextSlider() {
  }

  /// Method open user list
  _openUsers() async{
    routes.openUsersScreen(context);
  }

}