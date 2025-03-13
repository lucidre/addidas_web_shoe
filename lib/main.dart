import 'package:addidas_web_shoe/constants/style.dart';
import 'package:addidas_web_shoe/controllers/home_controller.dart';
import 'package:addidas_web_shoe/controllers/menu_controller.dart';
import 'package:addidas_web_shoe/controllers/navigation_controller.dart';
import 'package:addidas_web_shoe/firebase_options.dart';
import 'package:addidas_web_shoe/layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(NavigationController());
  Get.put(HomeController());
  Get.put(MenuController());
  runApp(const MyApp());
}

//test in
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Addidas Shoe",
      theme: ThemeData(
        scaffoldBackgroundColor: light,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ).apply(
          bodyColor: Colors.black,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
        primaryColor: Colors.blue,
      ),
      home: SiteLayout(),
    );
  }
}
