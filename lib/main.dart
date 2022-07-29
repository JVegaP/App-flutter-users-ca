import 'package:app_flutter_test_users/core/utils/preferences.dart';
import 'package:app_flutter_test_users/presentation/provider/users/users_provider.dart';
import 'package:app_flutter_test_users/presentation/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = Preferences();
  await prefs.initPrefs();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({Key? key}) : super(key: key);
  @override
  StateMyApp createState() => StateMyApp();
}

class StateMyApp extends State<MyApp>{

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.black87,
        statusBarIconBrightness: Brightness.light
    ));
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsersProvider(),),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }

}