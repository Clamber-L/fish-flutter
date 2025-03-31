import 'package:flutter/material.dart';
import 'package:flutter_fish/common/net/interceptor_catch.dart';
import 'package:flutter_fish/common/routers/names.dart';
import 'package:flutter_fish/common/routers/pages.dart';
import 'package:flutter_fish/common/utils/color_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812), // 设计稿尺寸
      builder: (context, child) {
        return GetMaterialApp(
          navigatorObservers: [CacheManager.observer],
          title: 'Music Player',
          debugShowCheckedModeBanner: false,
          getPages: RoutePages.list,
          initialRoute: RouteNames.splashView,
          defaultTransition: Transition.rightToLeft,
          theme: ThemeData(
            fontFamily: 'Circular Std',
            scaffoldBackgroundColor: TColor.bg,
            textTheme: Theme.of(context).textTheme.apply(
              bodyColor: TColor.primaryText,
              displayColor: TColor.secondaryText,
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: TColor.bg),
            useMaterial3: false,
            appBarTheme: AppBarTheme(
              toolbarHeight: 40,
              elevation: 0,
              backgroundColor: TColor.bg, // AppBar背景色
              titleTextStyle: TextStyle(color: TColor.bg), // AppBar标题样式
              iconTheme: IconThemeData(color: Colors.black), // AppBar图标颜色
            ),
          ),
        );
      },
    );
  }
}
