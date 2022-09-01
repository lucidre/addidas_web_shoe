import 'dart:math';

import 'package:addidas_web_shoe/pages/details/details.dart';
import 'package:addidas_web_shoe/pages/home/home.dart';
import 'package:addidas_web_shoe/routing/routes.dart';
import 'package:flutter/material.dart';

// import 'routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      return _getPageRoute(
        const HomePage(),
        arguement: settings.arguments,
      );
    case detailsRoute:
      return _getPageRoute(
        const DetailsPage(),
        arguement: settings.arguments,
      );

    default:
      return _getPageRoute(
        const SizedBox(),
        arguement: settings.arguments,
      );
  }
}

PageRoute _getPageRoute(Widget child, {Object? arguement}) {
  return CustomPageRoute(
    screen: child,
    argument: arguement,
  );
}

class CustomPageRoute extends PageRouteBuilder {
  CustomPageRoute(
      {required Widget screen,
      Object? argument,
      Alignment? alignment,
      Curve? curve})
      : super(
            pageBuilder: (_, __, ___) => screen,
            transitionsBuilder: (context, Animation<double> animation,
                    secondaryAnimation, Widget widget) =>
                buildPageTransitions(
                  null,
                  curve ?? Curves.easeIn,
                  alignment,
                  context,
                  animation,
                  secondaryAnimation,
                  widget,
                ),
            transitionDuration: const Duration(
              milliseconds: 200,
            ),
            settings: RouteSettings(arguments: argument));

  static Widget buildPageTransitions<T>(
    PageRoute<T>? route,
    Curve? initCurve,
    Alignment? alignment,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final curve = initCurve ?? Curves.easeIn;
    return CircularReveal().buildTransitions(
        context, curve, alignment, animation, secondaryAnimation, child);
  }
}

class CircularReveal {
  Widget buildTransitions(
      BuildContext context,
      Curve? curve,
      Alignment? alignment,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return CurveTransition(
      scale: animation,
      child: child,
    );
  }
}

class CurveTransition extends AnimatedWidget {
  const CurveTransition({
    Key? key,
    required Animation<double> scale,
    this.alignment = Alignment.center,
    this.child,
  }) : super(key: key, listenable: scale);

  Animation<double> get scale => listenable as Animation<double>;

  final Alignment alignment;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      clipper: CircularRevealClipper(
        revealPercent: scale.value,
      ),
      child: child,
    );
  }
}

class CircularRevealClipper extends CustomClipper<Rect> {
  final double revealPercent;

  CircularRevealClipper({required this.revealPercent});

  @override
  Rect getClip(Size size) {
    // center of rectangle
    final center = Offset(size.width / 2, size.height * 0.9);

    // Calculate distance from center to the top left corner to make sure we fill the screen via simple trigonometry.
    double theta = atan(center.dy / center.dx);
    final distanceToCorner = center.dy / sin(theta);

    final radius = distanceToCorner * revealPercent;
    final diameter = 2 * radius;

    return Rect.fromLTWH(
        center.dx - radius, center.dy - radius, diameter, diameter);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
