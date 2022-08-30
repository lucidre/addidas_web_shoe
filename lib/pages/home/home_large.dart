import 'package:addidas_web_shoe/constants/controllers.dart';
import 'package:addidas_web_shoe/controllers/home_controller.dart';
import 'package:addidas_web_shoe/models/shoe.dart';
import 'package:addidas_web_shoe/pages/home/widget/home_item.dart';
import 'package:addidas_web_shoe/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeLargePage extends StatelessWidget {
  const HomeLargePage({Key? key}) : super(key: key);

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

  void onHover(bool isHovering, AddidasShoe addidasShoe) {
    HomeController.instance.updateCurrentItem(isHovering, addidasShoe);
  }

  void onTap(AddidasShoe addidasShoe) {
    navigationController.navigateTo(
      detailsRoute,
      arguments: addidasShoe,
    );
  }
}
