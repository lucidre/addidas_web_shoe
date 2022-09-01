import 'package:addidas_web_shoe/constants/style.dart';
import 'package:addidas_web_shoe/pages/home/home.dart';
import 'package:addidas_web_shoe/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

import 'widgets/top_nav.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  SiteLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light,
      key: scaffoldKey,
      drawer: const Drawer(
        child: AppDrawer(),
      ),
      appBar: topNavigationBar(context, scaffoldKey),
      body: const HomePage(),
    );
  }
}
