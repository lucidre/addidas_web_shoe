import 'package:flutter/material.dart';

import '../constants/style.dart';
import 'custom_text.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    centerTitle: true,
    title: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        //
        Container(
          padding: const EdgeInsets.only(right: 20),
          child: CustomText(
            text: "Women",
            color: light.withOpacity(0.6),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(),
          child: Column(
            children: [
              Container(
                width: 5,
                height: 5,
                margin: const EdgeInsets.only(bottom: 3),
                decoration: BoxDecoration(
                  color: light,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              CustomText(
                text: "Men",
                color: light,
              ),
            ],
          ),
        ),
        const Spacer(),
        CustomText(
          text: 'Dash',
          color: light,
          size: 14,
          fontWeight: FontWeight.bold,
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
            Icons.settings_rounded,
            color: light,
            size: 16,
          ),
        ),
      ],
    ),
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color: dark),
  );
}
