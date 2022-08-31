import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItemIndex = 0.obs;
  var hoverItem = false.obs;

  changeActiveItemTo(int index) {
    activeItemIndex.value = index;
  }

  onHover(bool isHovering) {
    hoverItem.value = isHovering;
  }

  bool isActive(int index) => activeItemIndex.value == index;
}

class MenuItems {
  final String title;
  final IconData icons;
  final int index;

  MenuItems(this.title, this.icons, this.index);
}

final mainMenuItems = [
  MenuItems("Home", Icons.home_rounded, 0),
  MenuItems("News", Icons.newspaper_rounded, 1),
  MenuItems("Search", Icons.search_rounded, 2),
  MenuItems("Shop", Icons.shop_2_rounded, 3),
];
