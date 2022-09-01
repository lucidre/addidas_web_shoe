import 'package:addidas_web_shoe/controllers/menu_controller.dart';
import 'package:addidas_web_shoe/helpers/responsiveness.dart';
import 'package:addidas_web_shoe/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<MenuController>(builder: (controller) {
      return InkWell(
        onTap: () {},
        onHover: (isHovering) {
          controller.onHover(isHovering);
        },
        child: AnimatedContainer(
          duration: const Duration(microseconds: 500),
          color: Colors.black,
          padding: const EdgeInsets.all(15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            if (ResponsiveWidget.isSmallScreen(context))
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Image.asset(
                  "assets/logo/logo_white.png",
                  height: 30,
                ),
              ),
            ...mainMenuItems
                .map(
                  (item) => _DrawerIcon(
                    title: item.title,
                    icon: item.icons,
                    isSelected: controller.isActive(item.index),
                    onTap: () {
                      controller.changeActiveItemTo(item.index);
                    },
                    isExpanded: ResponsiveWidget.isSmallScreen(context)
                        ? true
                        : controller.hoverItem.value,
                  ),
                )
                .toList(),
            const Spacer(),
            _DrawerIcon(
              title: "Settings",
              icon: Icons.settings_rounded,
              isSelected: false,
              onTap: () {},
              isExpanded: ResponsiveWidget.isSmallScreen(context)
                  ? true
                  : controller.hoverItem.value,
            ),
          ]),
        ),
      );
    });
  }
}

class _DrawerIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final bool isExpanded;
  final VoidCallback onTap;
  const _DrawerIcon(
      {Key? key,
      required this.title,
      required this.icon,
      required this.isSelected,
      required this.onTap,
      required this.isExpanded})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(microseconds: 500),
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isSelected)
              Container(
                height: 35,
                width: 3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
            if (isExpanded)
              const SizedBox(
                width: 20,
              ),
            if (isExpanded)
              CustomText(
                text: title,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                size: 18,
              ),
          ],
        ),
      ),
    );
  }
}
