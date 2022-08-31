import 'dart:math';

import 'package:addidas_web_shoe/models/shoe.dart';
import 'package:addidas_web_shoe/widgets/custom_text.dart';
import 'package:addidas_web_shoe/widgets/top_nav.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final AddidasShoe addidasShoe =
        ModalRoute.of(context)?.settings.arguments as AddidasShoe;

    return Scaffold(
      appBar: topNavigationBar(context, scaffoldKey),
      body: Container(
        width: double.infinity,
        color: addidasShoe.backgroundColor,
        child: Stack(
          children: [
            buildBackgroundCIrcle(addidasShoe),
            buildBody(addidasShoe),
          ],
        ),
      ),
    );
  }

  Positioned buildBody(AddidasShoe addidasShoe) {
    return Positioned(
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
            buildShoeImage(addidasShoe),
            const SizedBox(
              width: 10,
            ),
            builbodyData(addidasShoe),
          ],
        ),
      ),
    );
  }

  Expanded builbodyData(AddidasShoe addidasShoe) {
    return Expanded(
      flex: 2,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: addidasShoe.subTitle.toUpperCase(),
              fontWeight: FontWeight.w800,
              color: addidasShoe.textColor,
              size: 20,
            ),
            const SizedBox(
              height: 5,
            ),
            CustomText(
              text: addidasShoe.mainTitle,
              color: addidasShoe.textColor,
              fontWeight: FontWeight.w500,
              size: 35,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.star_rounded,
                  color: addidasShoe.textColor,
                ),
                const SizedBox(
                  width: 3,
                ),
                Icon(
                  Icons.star_rounded,
                  color: addidasShoe.textColor,
                ),
                const SizedBox(
                  width: 3,
                ),
                Icon(
                  Icons.star_rounded,
                  color: addidasShoe.textColor,
                ),
                const SizedBox(
                  width: 3,
                ),
                Icon(
                  Icons.star_half_rounded,
                  color: addidasShoe.textColor,
                ),
                const SizedBox(
                  width: 3,
                ),
                Icon(
                  Icons.star_border_outlined,
                  color: addidasShoe.textColor,
                ),
                const SizedBox(
                  width: 3,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            CustomText(
                text: "RRP - \$129.99",
                color: addidasShoe.textColor,
                fontWeight: FontWeight.w600,
                size: 18),
            const SizedBox(
              height: 5,
            ),
            CustomText(
                text: loremDesc,
                color: addidasShoe.textColor,
                fontWeight: FontWeight.w400,
                size: 15),
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
      ),
    );
  }

  Expanded buildShoeImage(AddidasShoe addidasShoe) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Expanded(
      flex: 3,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 500,
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(400),
              color: addidasShoe.backgroundColor2,
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
                    height: 600,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: addidasShoe.backgroundColor2,
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 800,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: addidasShoe.backgroundColor2,
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 600,
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
            child: Hero(
              tag: addidasShoe.id.toString(),
              child: Transform.rotate(
                angle: pi / 4,
                child: Image.asset(
                  addidasShoe.imageLocation,
                  height: (screenHeight < screenWidth
                          ? screenHeight
                          : screenWidth) /
                      1.5,
                  width: (screenHeight < screenWidth
                          ? screenHeight
                          : screenWidth) /
                      1.5,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Positioned buildBackgroundCIrcle(AddidasShoe addidasShoe) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Positioned(
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
    );
  }
}

const loremDesc = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis a elit in nisi tempus euismod. Praesent ac sapien diam. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc congue placerat lacus, id cursus erat rhoncus ac. Quisque eget tortor viverra, aliquet nunc eu, euismod risus. Donec gravida auctor leo, id ornare lorem egestas a. Nam finibus justo nec iaculis convallis.

Quisque non quam nulla. Proin quis neque viverra, porta dui sed, gravida metus. Pellentesque tincidunt est quis leo ultrices tincidunt. Curabitur venenatis enim id felis cursus, a imperdiet erat tincidunt. Phasellus ultrices finibus massa, a mattis nibh finibus tristique. In nisl enim, venenatis maximus purus eu, congue vulputate nulla. Mauris faucibus sagittis consectetur. Morbi nisl mi, ornare pellentesque lacus vitae, rutrum maximus diam. Integer porta dui ultrices mi imperdiet, ut pulvinar lorem aliquam. Aliquam faucibus ipsum urna, sit amet volutpat mi iaculis eget. Pellentesque at urna at sem dictum elementum. Nullam lectus tellus, rhoncus nec tempus at, bibendum vitae ex. Duis convallis orci in sodales viverra. Integer hendrerit mi arcu, vitae malesuada est sagittis fringilla. Nam aliquet mauris sit amet nibh suscipit, in aliquet leo fringilla. Morbi ut risus cursus lectus placerat rhoncus nec a nulla. 
""";
