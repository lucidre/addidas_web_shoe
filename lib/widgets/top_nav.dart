import 'package:addidas_web_shoe/helpers/responsiveness.dart';
import 'package:flutter/material.dart';

import '../constants/style.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,

    title: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: (ResponsiveWidget.isSmallScreen(context)) ? 5 : 10,
        ),
        if (ResponsiveWidget.isSmallScreen(context))
          Padding(
            padding: const EdgeInsets.only(
              top: 5.0,
              bottom: 5.0,
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                if (key.currentState?.hasDrawer == true) {
                  if (key.currentState?.isDrawerOpen == true) {
                    key.currentState?.closeDrawer();
                  } else {
                    key.currentState?.openDrawer();
                  }
                }
              },
              child: Icon(
                Icons.menu_rounded,
                size: 20,
                color: light,
              ),
            ),
          )
        else
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
