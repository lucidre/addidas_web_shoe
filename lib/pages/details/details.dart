import 'dart:math';

import 'package:addidas_web_shoe/constants/controllers.dart';
import 'package:addidas_web_shoe/models/shoe.dart';
import 'package:addidas_web_shoe/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddidasShoe addidasShoe =
        ModalRoute.of(context)?.settings.arguments as AddidasShoe;
    /*   final AddidasShoe addidasShoe = AddidasShoe(
      imageLocation: 'assets/shoes/shoe4.png',
      subTitle: 'Originals',
      id: 3,
      mainTitle: 'NMD XR1',
      backgroundColor: const Color(0xFF26482A),
      textColor: const Color(0xFFDADAD9),
    );
     */
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      color: addidasShoe.backgroundColor,
      child: Stack(
        children: [
          Positioned(
            left: screenWidth / 1.5,
            top: -60,
            bottom: -60,
            child: Container(
              width: screenWidth * 2,
              height: screenHeight * 2,
              decoration: BoxDecoration(
                  color: addidasShoe.backgroundColor2,
                  borderRadius: BorderRadius.circular(screenWidth * 2)),
            ),
          ),
          /*       Positioned(
            left: -500,
            top: 0,
            bottom: 0,
            child: Container(
              width: screenWidth,
              height: screenHeight,
              decoration: BoxDecoration(
                  color: addidasShoe.textColor,
                  borderRadius: BorderRadius.circular(screenWidth / 2)),
            ),
          ), */
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 3,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                            color: addidasShoe.backgroundColor2,
                          ),
                        ),
                        Positioned(
                          child: Transform.rotate(
                            angle: pi / 4,
                            child: Container(
                              width: 30,
                              height: 500,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: addidasShoe.backgroundColor2,
                              ),
                            ),
                          ),
                        ),
                        Transform.scale(
                          scale: 1.4,
                          alignment: Alignment.centerLeft,
                          child: Transform.rotate(
                            angle: pi / 4,
                            child: Hero(
                              tag: addidasShoe.id.toString(),
                              child: Image.asset(
                                addidasShoe.imageLocation,
                                height: screenHeight / 3,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: addidasShoe.subTitle.toUpperCase(),
                          fontWeight: FontWeight.w800,
                          color: addidasShoe.textColor,
                          size: 25,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: addidasShoe.mainTitle,
                          color: addidasShoe.textColor,
                          fontWeight: FontWeight.w800,
                          size: 18,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: 250,
                          child: CustomText(
                            text:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                            color: addidasShoe.textColor,
                            fontWeight: FontWeight.w500,
                            size: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: addidasShoe.backgroundColor2,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: CustomText(
                            text: "BUY NOW",
                            color: addidasShoe.textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 10,
              left: 10,
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  navigationController.goBack();
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: addidasShoe.backgroundColor2,
                  ),
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: addidasShoe.textColor,
                    size: 14,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
