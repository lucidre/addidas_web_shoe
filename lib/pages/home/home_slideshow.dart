import 'package:addidas_web_shoe/controllers/home_controller.dart';
import 'package:addidas_web_shoe/helpers/responsiveness.dart';
import 'package:addidas_web_shoe/models/shoe.dart';
import 'package:addidas_web_shoe/pages/details/details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/home_item.dart';

class HomeSlideShow extends StatelessWidget {
  const HomeSlideShow({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: _HomeSlideShowLarge(
        onTap: (addidasShoe) => onTap(addidasShoe, context),
        onHover: onHover,
      ),
      smallScreen: _HomeSlideShowSmall(
        onTap: (addidasShoe) => onTap(addidasShoe, context),
        onHover: onHover,
      ),
    );
  }

  void onHover(bool isHovering, AddidasShoe addidasShoe) {
    HomeController.instance.updateCurrentItem(isHovering, addidasShoe);
  }

  void onTap(AddidasShoe addidasShoe, BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 600),
        settings: RouteSettings(arguments: addidasShoe),
        pageBuilder: (_, __, ___) => const DetailsPage(),
        transitionsBuilder: (_, anim1, __, child) => FadeTransition(
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(anim1),
          child: child,
        ),
      ),
    );
  }
}

class _HomeSlideShowLarge extends StatelessWidget {
  final Function(AddidasShoe) onTap;
  final Function(bool, AddidasShoe) onHover;
  const _HomeSlideShowLarge(
      {Key? key, required this.onTap, required this.onHover})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(builder: (controller) {
      return Row(
        children: allShoes
            .map(
              (addidasShoe) => HomeItem(
                addidasShoe: addidasShoe,
                isExpanded: controller.isItemExpanded(addidasShoe),
                onTap: () => onTap(addidasShoe),
                onHover: (isHovering) => onHover(isHovering, addidasShoe),
              ),
            )
            .toList(),
      );
    });
  }
}

class _HomeSlideShowSmall extends StatelessWidget {
  final Function(AddidasShoe) onTap;
  final Function(bool, AddidasShoe) onHover;
  const _HomeSlideShowSmall(
      {Key? key, required this.onTap, required this.onHover})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemCount: allShoes.length,
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (ctx, index) {
          final addidasShoe = allShoes[index];
          return GetX<HomeController>(builder: (controller) {
            return HomeItem(
              addidasShoe: addidasShoe,
              isExpanded: controller.isItemExpanded(addidasShoe),
              onTap: () => onTap(addidasShoe),
              onHover: (isHovering) => onHover(isHovering, addidasShoe),
            );
          });
        });
  }
}
