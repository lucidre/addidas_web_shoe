import 'package:addidas_web_shoe/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  Rx<AddidasShoe> currentShoe = AddidasShoe(
          imageLocation: '',
          subTitle: '',
          mainTitle: '',
          backgroundColor2: Colors.black,
          id: -1,
          backgroundColor: Colors.white,
          textColor: Colors.white)
      .obs;

  bool isItemExpanded(AddidasShoe addidasShoe) =>
      addidasShoe.id == currentShoe.value.id;

  updateCurrentItem(bool isActive, AddidasShoe? addidasShoe) {
    if (isActive) {
      if (addidasShoe == null) return;
      currentShoe.value = addidasShoe;
    } else {
      if (addidasShoe == null) {
        currentShoe.value = AddidasShoe(
            imageLocation: '',
            backgroundColor2: Colors.black,
            subTitle: '',
            mainTitle: '',
            id: -1,
            backgroundColor: Colors.white,
            textColor: Colors.white);
      } else {
        currentShoe.value = addidasShoe;
      }
    }
  }
}
