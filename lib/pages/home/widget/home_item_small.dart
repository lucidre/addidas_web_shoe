import 'dart:math';

import 'package:addidas_web_shoe/models/shoe.dart';
import 'package:addidas_web_shoe/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class HomeItemSmall extends StatefulWidget {
  final AddidasShoe addidasShoe;
  final Function(bool) onHover;
  final VoidCallback onTap;
  final bool isExpanded;
  const HomeItemSmall(
      {Key? key,
      required this.addidasShoe,
      required this.onHover,
      required this.isExpanded,
      required this.onTap})
      : super(key: key);

  @override
  State<HomeItemSmall> createState() => _HomeItemSmallState();
}

class _HomeItemSmallState extends State<HomeItemSmall> {
  bool heroAnimationCompleted = false;
  final Duration _duration = const Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  Widget buildBody(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final itemWidth = constraints.maxWidth;
      return Container(
        width: double.infinity,
        height: itemWidth,
        color: widget.addidasShoe.backgroundColor,
        child: InkWell(
          splashColor: Colors.transparent,
          onTap: () => widget.onTap(),
          onHover: (isActive) {
            widget.onHover(isActive);
          },
          child: buildExpandedBody(
            context,
            itemWidth,
          ),
        ),
      );
    });
  }

  Widget buildExpandedBody(BuildContext context, double itemWidth) {
    return Stack(
      children: [
        buildImage(itemWidth),
        buildText(),
      ],
    );
  }

  AnimatedPositioned buildImage(double itemWidth) {
    return AnimatedPositioned(
      duration: _duration,
      right: widget.isExpanded ? 5 : -itemWidth / 2,
      top: widget.isExpanded ? 5 : 0,
      bottom: 0,
      child: AnimatedContainer(
        duration: _duration,
        alignment: widget.isExpanded ? Alignment.center : Alignment.centerRight,
        child: Hero(
          tag: widget.addidasShoe.id.toString(),
          flightShuttleBuilder: (flightContext, animation, flightDirection,
              fromHeroContext, toHeroContext) {
            animation.addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                setState(() => heroAnimationCompleted = true);
              }
              if (status == AnimationStatus.dismissed) {
                setState(() => heroAnimationCompleted = false);
              }
            });

            return RotationTransition(
              turns: animation.drive(
                Tween<double>(
                    begin: (heroAnimationCompleted) ? 1.0 : -0.8,
                    end: (heroAnimationCompleted) ? 0.8 : -1.0),
              ),
              child: toHeroContext.widget,
            );
          },
          child: Transform.rotate(
            angle: widget.isExpanded ? 0 : pi / 4,
            child: Image.asset(
              widget.addidasShoe.imageLocation,
              fit: BoxFit.fitWidth,
              width: itemWidth + (widget.isExpanded ? -20 : 50),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildText() {
    return Positioned(
      bottom: 10,
      top: 0,
      left: 10,
      child: AnimatedContainer(
          duration: _duration,
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: widget.addidasShoe.subTitle,
                fontWeight: FontWeight.bold,
                color: widget.addidasShoe.textColor,
                size: 20,
              ),
              CustomText(
                text: widget.addidasShoe.mainTitle,
                color: widget.addidasShoe.textColor,
                fontWeight: FontWeight.bold,
                size: 20,
              ),
            ],
          )),
    );
  }
}
