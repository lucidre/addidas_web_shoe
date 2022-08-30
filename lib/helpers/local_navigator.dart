import 'package:addidas_web_shoe/constants/controllers.dart';
import 'package:addidas_web_shoe/routing/router.dart';
import 'package:addidas_web_shoe/routing/routes.dart';
import 'package:flutter/material.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigatorKey,
      initialRoute: homeRoute,
      onGenerateRoute: generateRoute,
    );
