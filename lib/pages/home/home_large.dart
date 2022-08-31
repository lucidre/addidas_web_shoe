import 'package:addidas_web_shoe/controllers/home_controller.dart';
import 'package:addidas_web_shoe/models/shoe.dart';
import 'package:addidas_web_shoe/pages/details/details.dart';
import 'package:addidas_web_shoe/pages/home/home_header.dart';
import 'package:addidas_web_shoe/pages/home/widget/home_item.dart';
import 'package:addidas_web_shoe/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(builder: (controller) {
      return Row(
        children: [
          const AppDrawer(),
          Expanded(
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const HomeHeader(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: allShoes
                          .map(
                            (addidasShoe) => HomeItem(
                              addidasShoe: addidasShoe,
                              isExpanded:
                                  controller.isItemExpanded(addidasShoe),
                              onTap: () => onTap(addidasShoe, context),
                              onHover: (isHovering) =>
                                  onHover(isHovering, addidasShoe),
                            ),
                          )
                          .toList(),
                    ),
                    /*    Row(
                      children: const [
                        HomeVideoItem(),
                        SizedBox(
                          width: 5,
                        ),
                        HomeVideoItem(),
                        SizedBox(
                          width: 5,
                        ),
                        HomeVideoItem(),
                        SizedBox(
                          width: 5,
                        ),
                        HomeVideoItem(),
                      ],
                    ), */
                    const SizedBox(
                      height: 1000,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  void onHover(bool isHovering, AddidasShoe addidasShoe) {
    HomeController.instance.updateCurrentItem(isHovering, addidasShoe);
  }

  void onTap(AddidasShoe addidasShoe, BuildContext context) {
/*     navigationController.navigateTo(
      detailsRoute,
      arguments: addidasShoe,
    ); */
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
                )));
  }
}
