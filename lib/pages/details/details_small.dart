import 'dart:math';

import 'package:addidas_web_shoe/models/shoe.dart';
import 'package:addidas_web_shoe/widgets/custom_text.dart';
import 'package:addidas_web_shoe/widgets/top_nav.dart';
import 'package:flutter/material.dart';

class DetailsPageSmall extends StatefulWidget {
  const DetailsPageSmall({Key? key}) : super(key: key);

  @override
  State<DetailsPageSmall> createState() => _DetailsPageSmallState();
}

class _DetailsPageSmallState extends State<DetailsPageSmall> {
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
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildShoeImage(addidasShoe),
            const SizedBox(
              height: 10,
            ),
            builbodyData(addidasShoe),
          ],
        ),
      ),
    );
  }

  Widget builbodyData(AddidasShoe addidasShoe) {
    return Column(
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
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
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
    );
  }

  Widget buildShoeImage(AddidasShoe addidasShoe) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(300),
            color: addidasShoe.backgroundColor2,
          ),
        ),
        Positioned(
          child: Transform.rotate(
            angle: -pi / 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 400,
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: addidasShoe.backgroundColor2,
                  ),
                ),
                Container(
                  width: 500,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: addidasShoe.backgroundColor2,
                  ),
                ),
                Container(
                  width: 400,
                  height: 10,
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: addidasShoe.backgroundColor2,
                  ),
                ),
              ],
            ),
          ),
        ),
        Transform.scale(
          scale: 1.2,
          alignment: Alignment.centerLeft,
          child: Hero(
            tag: addidasShoe.id.toString(),
            child: Transform.rotate(
              angle: 0,
              child: Image.asset(
                addidasShoe.imageLocation,
                height:
                    (screenHeight < screenWidth ? screenHeight : screenWidth) /
                        1.5,
                width:
                    (screenHeight < screenWidth ? screenHeight : screenWidth) /
                        1.5,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Positioned buildBackgroundCIrcle(AddidasShoe addidasShoe) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Positioned(
      right: -screenWidth / 2,
      bottom: -screenWidth / 2,
      child: Container(
        width: screenWidth,
        height: screenWidth,
        decoration: BoxDecoration(
            color: addidasShoe.backgroundColor2,
            borderRadius: BorderRadius.circular(screenWidth)),
      ),
    );
  }
}

const loremDesc = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis a elit in nisi tempus euismod. Praesent ac sapien diam. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc congue placerat lacus, id cursus erat rhoncus ac. Quisque eget tortor viverra, aliquet nunc eu, euismod risus. Donec gravida auctor leo, id ornare lorem egestas a. Nam finibus justo nec iaculis convallis.

Quisque non quam nulla. Proin quis neque viverra, porta dui sed, gravida metus. Pellentesque tincidunt est quis leo ultrices tincidunt. Curabitur venenatis enim id felis cursus, a imperdiet erat tincidunt. Phasellus ultrices finibus massa, a mattis nibh finibus tristique. In nisl enim, venenatis maximus purus eu, congue vulputate nulla. Mauris faucibus sagittis consectetur. Morbi nisl mi, ornare pellentesque lacus vitae, rutrum maximus diam. Integer porta dui ultrices mi imperdiet, ut pulvinar lorem aliquam. Aliquam faucibus ipsum urna, sit amet volutpat mi iaculis eget. Pellentesque at urna at sem dictum elementum. Nullam lectus tellus, rhoncus nec tempus at, bibendum vitae ex. Duis convallis orci in sodales viverra. Integer hendrerit mi arcu, vitae malesuada est sagittis fringilla. Nam aliquet mauris sit amet nibh suscipit, in aliquet leo fringilla. Morbi ut risus cursus lectus placerat rhoncus nec a nulla. 
""";
