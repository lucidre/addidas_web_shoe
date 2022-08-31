import 'package:addidas_web_shoe/controllers/menu_controller.dart';
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
            ...mainMenuItems
                .map(
                  (item) => _DrawerIcon(
                    title: item.title,
                    icon: item.icons,
                    isSelected: controller.isActive(item.index),
                    onTap: () {
                      controller.changeActiveItemTo(item.index);
                    },
                    isExpanded: controller.hoverItem.value,
                  ),
                )
                .toList(),
            const Spacer(),
            const Divider(
              color: Colors.white,
              height: 1,
            ),
            _DrawerIcon(
                title: "Settings",
                icon: Icons.settings_rounded,
                isSelected: false,
                onTap: () {},
                isExpanded: false),
            _DrawerIcon(
                title: "Log Out",
                icon: Icons.logout_rounded,
                isSelected: false,
                onTap: () {},
                isExpanded: false),
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
