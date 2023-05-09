import 'package:bmicalculatoranime/screen/view/anime_screen.dart';
import 'package:bmicalculatoranime/screen/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'calculate_screen/view/calc.dart';

void main() {
  runApp(
    Sizer(builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(name: '/', page: () => Splash_screen(),transition: Transition.leftToRight),
          GetPage(name: '/Homescreen', page: () => Homescreen(),transition: Transition.leftToRight),
          GetPage(name: '/Resultscreen', page: () => calce(),transition: Transition.leftToRight),
        ],
      ),
    ),
  );
}

