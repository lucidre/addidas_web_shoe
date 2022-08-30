import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  static NavigationController instance = Get.find();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  Future<dynamic> navigateTo(
    String routeName, {
    Object? arguments,
  }) {
    if (navigatorKey.currentState == null) {
      return throw Exception("Current navigator state is null");
    }
    final data = navigatorKey.currentState!.pushNamed(
      routeName,
      arguments: arguments,
    );
    return data;
  }

  goBack() => navigatorKey.currentState?.pop();
}
