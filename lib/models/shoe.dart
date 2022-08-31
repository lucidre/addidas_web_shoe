import 'package:flutter/material.dart';

class AddidasShoe {
  final String imageLocation;
  final String subTitle;
  final String mainTitle;
  final int id;
  final Color backgroundColor;
  final Color textColor;
  final Color backgroundColor2;

  AddidasShoe({
    required this.imageLocation,
    required this.subTitle,
    required this.mainTitle,
    required this.id,
    required this.backgroundColor,
    required this.backgroundColor2,
    required this.textColor,
  });
}

List<AddidasShoe> allShoes = [
  AddidasShoe(
    imageLocation: 'assets/shoes/shoe1.png',
    subTitle: 'Grey Noosas',
    mainTitle: 'XX3',
    id: 0,
    backgroundColor: const Color(0xFF242424),
    backgroundColor2: Colors.black,
    textColor: const Color(0xFFCDCBCC),
  ),
  AddidasShoe(
    imageLocation: 'assets/shoes/shoe2.png',
    subTitle: 'Swift Red',
    mainTitle: 'WHT',
    id: 1,
    backgroundColor: const Color(0xFFD4D4D4),
    backgroundColor2: Colors.white,
    textColor: const Color(0xFF0D1816),
  ),
  AddidasShoe(
    imageLocation: 'assets/shoes/shoe3.png',
    subTitle: 'Noosa FF 2',
    mainTitle: 'Running',
    id: 2,
    backgroundColor: const Color(0xFFE2FA7E),
    backgroundColor2: Colors.white,
    textColor: Colors.black,
  ),
  AddidasShoe(
    imageLocation: 'assets/shoes/shoe4.png',
    subTitle: 'Originals',
    id: 3,
    backgroundColor2: Colors.black,
    mainTitle: 'NMD XR1',
    backgroundColor: const Color(0xFF26482A),
    textColor: const Color(0xFFDADAD9),
  ),
  AddidasShoe(
    imageLocation: 'assets/shoes/shoe5.png',
    subTitle: 'Originals',
    id: 4,
    backgroundColor2: Colors.black,
    mainTitle: 'NMD XR1',
    backgroundColor: const Color(0xFF1c1c1f),
    textColor: Colors.white,
  ),
];
