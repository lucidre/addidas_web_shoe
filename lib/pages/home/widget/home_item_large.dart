import 'dart:math';

import 'package:addidas_web_shoe/models/shoe.dart';
import 'package:addidas_web_shoe/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class HomeItemLarge extends StatefulWidget {
  final AddidasShoe addidasShoe;
  final Function(bool) onHover;
  final VoidCallback onTap;
  final bool isExpanded;
  const HomeItemLarge(
      {Key? key,
      required this.addidasShoe,
      required this.onHover,
      required this.isExpanded,
      required this.onTap})
      : super(key: key);

  @override
  State<HomeItemLarge> createState() => _HomeItemLargeState();
}

class _HomeItemLargeState extends State<HomeItemLarge> {
  bool heroAnimationCompleted = false;
  final Duration _duration = const Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.isExpanded ? 2 : 1,
      child: AnimatedSize(
        duration: _duration,
        curve: Curves.easeInSine,
        child: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final itemWidth = constraints.maxWidth;
      return Container(
        width: double.infinity,
        height: 600,
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
      right: widget.isExpanded ? 20 : -itemWidth / 2,
      top: 0,
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
                        end: (heroAnimationCompleted) ? 0.8 : -1.0)
                    .chain(CurveTween(
                        curve: (heroAnimationCompleted)
                            ? const Cubic(0.4, 0.90, 1.0, 1.250).flipped
                            : const Cubic(0.4, 0.90, 1.0, 1.250))),
              ),
              child: toHeroContext.widget,
            );
          },
          child: Transform.scale(
            scale: widget.isExpanded ? 1 : 1,
            child: Transform.rotate(
              angle: pi / 4,
              child: Image.asset(
                widget.addidasShoe.imageLocation,
                fit: BoxFit.fitWidth,
                width: itemWidth + (widget.isExpanded ? 0 : 50),
                scale: widget.isExpanded ? 1.2 : 1,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildText() {
    return Positioned(
      bottom: widget.isExpanded ? 50 : 0,
      top: 0,
      left: widget.isExpanded ? 50 : 10,
      child: AnimatedContainer(
        duration: _duration,
        alignment:
            widget.isExpanded ? Alignment.bottomCenter : Alignment.center,
        child: widget.isExpanded
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: widget.addidasShoe.subTitle,
                    fontWeight: FontWeight.bold,
                    color: widget.addidasShoe.textColor,
                    size: 24,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: widget.addidasShoe.mainTitle,
                    color: widget.addidasShoe.textColor,
                    fontWeight: FontWeight.bold,
                    size: 24,
                  ),
                ],
              )
            : RotatedBox(
                quarterTurns: 1,
                child: Hero(
                  tag: widget.addidasShoe.subTitle,
                  child: CustomText(
                    text: widget.addidasShoe.subTitle,
                    fontWeight: FontWeight.bold,
                    color: widget.addidasShoe.textColor,
                    size: 24,
                  ),
                ),
              ),
      ),
    );
  }
}
