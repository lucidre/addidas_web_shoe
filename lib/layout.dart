import 'package:addidas_web_shoe/constants/style.dart';
import 'package:addidas_web_shoe/helpers/local_navigator.dart';
import 'package:addidas_web_shoe/helpers/responsiveness.dart';
import 'package:flutter/material.dart';

import 'widgets/top_nav.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  SiteLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light,
      extendBodyBehindAppBar: true,
      key: scaffoldKey,
      appBar: topNavigationBar(context, scaffoldKey),
      body: ResponsiveWidget(
        largeScreen: localNavigator(),
      ),
    );
  }
}
