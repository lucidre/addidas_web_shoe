import 'package:addidas_web_shoe/helpers/responsiveness.dart';
import 'package:addidas_web_shoe/pages/home/home_header.dart';
import 'package:addidas_web_shoe/pages/home/home_slideshow.dart';
import 'package:addidas_web_shoe/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!ResponsiveWidget.isSmallScreen(context)) const AppDrawer(),
        buildBody(),
      ],
    );
  }

  Expanded buildBody() {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: const [
              HomeHeader(),
              SizedBox(
                height: 10,
              ),
              HomeSlideShow(),
            ],
          ),
        ),
      ),
    );
  }
}
