import 'package:flutter/material.dart';

import '../constants/style.dart';
import 'custom_text.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    centerTitle: true,
    title: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: Image.asset(
            "assets/logo/logo_white.png",
            height: 30,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.only(right: 20),
          child: Icon(
            Icons.shopping_cart_rounded,
            color: light,
            size: 16,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(),
          child: Icon(
            Icons.person_rounded,
            color: light,
            size: 16,
          ),
        ),
      ],
    ),
    backgroundColor: Colors.black,
    // backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color: dark),
  );
}
