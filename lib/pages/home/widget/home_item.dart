import 'dart:math';

import 'package:addidas_web_shoe/models/shoe.dart';
import 'package:addidas_web_shoe/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  final AddidasShoe addidasShoe;
  final Function(bool) onHover;
  final VoidCallback onTap;
  final bool isExpanded;
  const HomeItem(
      {Key? key,
      required this.addidasShoe,
      required this.onHover,
      required this.isExpanded,
      required this.onTap})
      : super(key: key);

  final Duration _duration = const Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: isExpanded ? 2 : 1,
      child: AnimatedSize(
        duration: _duration,
        curve: Curves.fastOutSlowIn,
        child: buildBody(context),
      ),
    );
  }

  Container buildBody(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: addidasShoe.backgroundColor,
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () => onTap(),
        onHover: (isActive) {
          onHover(isActive);
        },
        child: buildExpandedBody(context),
      ),
    );
  }

  Widget buildExpandedBody(BuildContext context) {
    final itemWidth = MediaQuery.of(context).size.width / 4;
    return Stack(
      children: [
        AnimatedPositioned(
          duration: _duration,
          right: isExpanded ? 20 : -itemWidth / 2,
          top: 0,
          bottom: 0,
          child: AnimatedContainer(
            duration: _duration,
            alignment: isExpanded ? Alignment.center : Alignment.centerRight,
            child: Transform.scale(
              scale: isExpanded ? 1.8 : 1,
              child: Transform.rotate(
                angle: pi / 4,
                child: Hero(
                  tag: addidasShoe.id.toString(),
                  child: Image.asset(
                    addidasShoe.imageLocation,
                    fit: BoxFit.fitWidth,
                    width: itemWidth + (isExpanded ? 0 : 50),
                    scale: isExpanded ? 1 : 1.2,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          left: 50,
          child: AnimatedSwitcher(
            duration: _duration,
            child: isExpanded
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: addidasShoe.subTitle,
                        fontWeight: FontWeight.w600,
                        color: addidasShoe.textColor,
                        size: 14,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: addidasShoe.mainTitle,
                        color: addidasShoe.textColor,
                        fontWeight: FontWeight.w600,
                        size: 14,
                      ),
                    ],
                  )
                : const SizedBox(),
          ),
        ),
      ],
    );
  }
}
