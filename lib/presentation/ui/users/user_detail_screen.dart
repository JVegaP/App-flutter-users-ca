import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:app_flutter_test_users/core/utils/dictionary.dart';
import 'package:app_flutter_test_users/core/utils/preferences.dart';
import 'package:app_flutter_test_users/presentation/provider/users/users_provider.dart';
import 'package:app_flutter_test_users/presentation/widgets/app_bar.dart';
import 'package:app_flutter_test_users/presentation/widgets/text_label_custom.dart';
import 'package:app_flutter_test_users/presentation/widgets/view_empty.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UsersDetailPage extends StatefulWidget {
  const UsersDetailPage({Key? key}) : super(key: key);
  @override
  UsersDetail createState()=> UsersDetail();
}

class UsersDetail extends State<UsersDetailPage> {
  late UsersProvider provider;
  final prefs = Preferences();
  final picker = ImagePicker();

  @override
  void initState() {
    provider = Provider.of<UsersProvider>(context,listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      provider.imageLoad = false;
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<UsersProvider>(this.context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Padding(padding: const EdgeInsets.only(top: 80),
                    child: Center(
                      child: prefs.users != "0" ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          ZoomIn(
                            delay: const Duration(milliseconds: 150),
                            duration: const Duration(milliseconds: 350),
                            child: InkWell(
                              onTap: () {
                                _openSelectPhoto();
                              },
                              child: Container(
                                height: 120, width: 120,
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
                                          width: 60,
                                          height: 60,
                                          fit: BoxFit.cover,),
                                      ),
                                      provider.imageLoad ?
                                      Image.file(provider.selectedImage, fit: BoxFit.cover) :
                                      FadeInImage.assetNetwork(
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover,
                                        placeholderScale: 0.5,
                                        placeholder: '',
                                        image: provider.user.avatar,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          FadeIn(
                              delay: const Duration(milliseconds: 150),
                              duration: const Duration(milliseconds: 350),
                              child: textLabelCustom('${provider.user.firstName} ${provider.user.lastName}', TextAlign.start, Colors.black87, 22, FontWeight.bold)),
                          const SizedBox(height: 5),
                          FadeIn(
                              delay: const Duration(milliseconds: 150),
                              duration: const Duration(milliseconds: 350),
                              child: textLabelCustom(provider.user.email, TextAlign.start, Colors.black54, 18, FontWeight.normal)),
                        ],
                      ) : 
                      viewEmpty(context),
                    )
                ),
                Column(
                  children: [
                    appBar(context, true, false, _functionDisable),
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }

  _functionDisable() {
  }

  /// Show dialog for select image of camera or gallery
  _openSelectPhoto() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera),
              title: Text(dictionary.camera),
              onTap: () {
                getImage(ImageSource.camera);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: Text(dictionary.gallery),
              onTap: () {
                getImage(ImageSource.gallery);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  /// Method for capture image the camera or gallery
  getImage(ImageSource src) async {
    final pickedFile = await picker.getImage(source: src);
    if (pickedFile != null) {
      final File? croppedImage = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxHeight: 700,
        maxWidth: 700,
        compressFormat: ImageCompressFormat.jpg,
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: dictionary.camera,
        ),
        iosUiSettings: IOSUiSettings(
          title: dictionary.camera,
        ),
      );
      if(croppedImage!=null) {
        provider.imageLoad = true;
        provider.selectedImage = croppedImage;
      }
    }
  }

}