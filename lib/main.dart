import 'package:flutter/material.dart';
import 'package:flutter_fish/common/net/interceptor_catch.dart';
import 'package:flutter_fish/common/routers/names.dart';
import 'package:flutter_fish/common/routers/pages.dart';
import 'package:flutter_fish/common/utils/color_extension.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorObservers: [CacheManager.observer],
      title: 'Music Player',
      debugShowCheckedModeBanner: false,
      getPages: RoutePages.list,
      initialRoute: RouteNames.splashView,
      defaultTransition: Transition.leftToRight,
      theme: ThemeData(
        fontFamily: 'Circular Std',
        scaffoldBackgroundColor: TColor.bg,
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: TColor.primaryText,
          displayColor: TColor.primaryText,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: TColor.primary),
        useMaterial3: false,
      ),
    );
  }
}
