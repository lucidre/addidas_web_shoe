import 'dart:math';

import 'package:addidas_web_shoe/helpers/responsiveness.dart';
import 'package:addidas_web_shoe/models/shoe.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_text.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddidasShoe addidasShoe2 = AddidasShoe(
      imageLocation: 'assets/shoes/shoe4.png',
      subTitle: 'Run like never before',
      id: 3,
      mainTitle:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
      backgroundColor: Colors.white,
      textColor: Colors.black,
      backgroundColor2: Colors.black,
    );
    final AddidasShoe addidasShoe = AddidasShoe(
      imageLocation: 'assets/shoes/shoe_flip2.png',
      subTitle: 'adidas Alphabounce',
      id: 0,
      mainTitle:
          'Step to a new level. Designed specifically for training and running at speed, these adidas running shoes help you get to the next level.',
      backgroundColor: const Color(0xFFFFD700),
      textColor: Colors.black,
      backgroundColor2: Colors.black,
    );
    return Column(
      children: [
        ResponsiveWidget(
          smallScreen: HomeHeader1Small(addidasShoe: addidasShoe),
          largeScreen: HomeHeader1Big(addidasShoe: addidasShoe),
        ),
        ResponsiveWidget(
          smallScreen: HomeHeader2Small(addidasShoe: addidasShoe2),
          largeScreen: HomeHeader2Big(addidasShoe: addidasShoe2),
        ),
      ],
    );
  }
}

class HomeHeader1Small extends StatelessWidget {
  const HomeHeader1Small({
    Key? key,
    required this.addidasShoe,
  }) : super(key: key);

  final AddidasShoe addidasShoe;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: addidasShoe.backgroundColor,
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          buildBackgroundLogo(),
          buildBody(),
        ],
      ),
    );
  }

  Widget buildBody() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  color: addidasShoe.backgroundColor2,
                ),
              ),
              Transform.rotate(
                angle: pi / 4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 10,
                      margin: const EdgeInsets.only(bottom: 10),
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: addidasShoe.backgroundColor2,
                      ),
                    ),
                    Container(
                      height: 10,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: addidasShoe.backgroundColor2,
                      ),
                    ),
                    Container(
                      height: 10,
                      width: 250,
                      margin: const EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: addidasShoe.backgroundColor2,
                      ),
                    ),
                  ],
                ),
              ),
              Transform.scale(
                scale: 1.4,
                alignment: Alignment.center,
                child: Image.asset(
                  addidasShoe.imageLocation,
                  height: 300,
                  width: 300,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          CustomText(
            text: addidasShoe.subTitle,
            color: addidasShoe.textColor,
            fontWeight: FontWeight.w800,
            size: 30,
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 400,
            child: CustomText(
              text: addidasShoe.mainTitle,
              color: addidasShoe.textColor,
              fontWeight: FontWeight.w500,
              size: 14,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
            color: Colors.black,
            child: const CustomText(
              text: 'SHOP NOW',
              fontWeight: FontWeight.bold,
              size: 16,
              color: Color(0xFFFFD700),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  Positioned buildBackgroundLogo() {
    return Positioned(
      bottom: -250,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Image.asset(
          'assets/logo/logo.png',
          opacity: const AlwaysStoppedAnimation(0.2),
          width: 600,
          height: 600,
        ),
      ),
    );
  }
}

class HomeHeader1Big extends StatelessWidget {
  const HomeHeader1Big({
    Key? key,
    required this.addidasShoe,
  }) : super(key: key);

  final AddidasShoe addidasShoe;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFD700),
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Positioned(
            bottom: -400,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(pi),
              child: Image.asset(
                'assets/logo/logo.png',
                opacity: const AlwaysStoppedAnimation(0.3),
                width: 800,
                height: 800,
              ),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: addidasShoe.subTitle,
                            color: addidasShoe.textColor,
                            fontWeight: FontWeight.w800,
                            size: 40,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 300,
                            child: CustomText(
                              text: addidasShoe.mainTitle,
                              color: addidasShoe.textColor,
                              fontWeight: FontWeight.w500,
                              size: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 5, bottom: 5),
                            color: Colors.black,
                            child: const CustomText(
                              text: 'SHOP NOW',
                              fontWeight: FontWeight.bold,
                              size: 16,
                              color: Color(0xFFFFD700),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 200),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            child: Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(300),
                                color: addidasShoe.backgroundColor2,
                              ),
                            ),
                          ),
                          Positioned(
                            child: Transform.rotate(
                              angle: -pi / 4,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 30,
                                    margin: const EdgeInsets.only(right: 20),
                                    height: 400,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: addidasShoe.backgroundColor2,
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                    height: 500,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: addidasShoe.backgroundColor2,
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                    height: 400,
                                    margin: const EdgeInsets.only(left: 20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: addidasShoe.backgroundColor2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Transform.scale(
                            scale: 1.3,
                            alignment: Alignment.center,
                            child: Transform.rotate(
                              angle: -pi / 4,
                              child: Image.asset(
                                addidasShoe.imageLocation,
                                height: 400,
                                width: 400,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // buildIndicators(context),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeHeader2Big extends StatelessWidget {
  final AddidasShoe addidasShoe;
  const HomeHeader2Big({super.key, required this.addidasShoe});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            bottom: -400,
            right: 0,
            child: Image.asset(
              'assets/logo/logo.png',
              opacity: const AlwaysStoppedAnimation(0.3),
              width: 800,
              height: 800,
            )),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(left: 200),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            child: Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(300),
                                color: addidasShoe.backgroundColor2,
                              ),
                            ),
                          ),
                          Positioned(
                            child: Transform.rotate(
                              angle: pi / 4,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 30,
                                    margin: const EdgeInsets.only(right: 20),
                                    height: 400,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: addidasShoe.backgroundColor2,
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                    height: 500,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: addidasShoe.backgroundColor2,
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                    height: 400,
                                    margin: const EdgeInsets.only(left: 20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: addidasShoe.backgroundColor2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Transform.scale(
                            scale: 1.4,
                            alignment: Alignment.centerLeft,
                            child: Transform.rotate(
                              angle: pi / 4,
                              child: Image.asset(
                                addidasShoe.imageLocation,
                                height: 400,
                                width: 400,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                          text: addidasShoe.subTitle,
                          color: addidasShoe.textColor,
                          fontWeight: FontWeight.w800,
                          size: 25,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: 300,
                          child: CustomText(
                            text: addidasShoe.mainTitle,
                            color: addidasShoe.textColor,
                            fontWeight: FontWeight.w500,
                            size: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              buildIndicators(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildIndicators(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 35,
      child: SizedBox(
        height: 6,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.only(right: 5),
              height: 8,
              width: (0 == index) ? 50 : 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black,
              ),
            );
          },
          itemCount: 5,
        ),
      ),
    );
  }
}

class HomeHeader2Small extends StatelessWidget {
  final AddidasShoe addidasShoe;
  const HomeHeader2Small({
    super.key,
    required this.addidasShoe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: addidasShoe.backgroundColor,
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          buildBackgroundLogo(),
          buildBody(context),
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  color: addidasShoe.backgroundColor2,
                ),
              ),
              Transform.rotate(
                angle: -pi / 4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 10,
                      margin: const EdgeInsets.only(bottom: 10),
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: addidasShoe.backgroundColor2,
                      ),
                    ),
                    Container(
                      height: 10,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: addidasShoe.backgroundColor2,
                      ),
                    ),
                    Container(
                      height: 10,
                      width: 250,
                      margin: const EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: addidasShoe.backgroundColor2,
                      ),
                    ),
                  ],
                ),
              ),
              Transform.scale(
                scale: 1.4,
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  addidasShoe.imageLocation,
                  height: 300,
                  width: 300,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          CustomText(
            text: addidasShoe.subTitle,
            color: addidasShoe.textColor,
            fontWeight: FontWeight.w800,
            size: 30,
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 500,
            child: CustomText(
              text: addidasShoe.mainTitle,
              color: addidasShoe.textColor,
              fontWeight: FontWeight.w500,
              size: 14,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          buildIndicators(context),
        ],
      ),
    );
  }

  Positioned buildBackgroundLogo() {
    return Positioned(
        bottom: -250,
        right: 0,
        child: Image.asset(
          'assets/logo/logo.png',
          opacity: const AlwaysStoppedAnimation(0.2),
          width: 600,
          height: 600,
        ));
  }

  Widget buildIndicators(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 35,
      child: SizedBox(
        height: 6,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.only(right: 5),
              height: 8,
              width: (0 == index) ? 50 : 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black,
              ),
            );
          },
          itemCount: 5,
        ),
      ),
    );
  }
}
