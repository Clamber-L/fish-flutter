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
            scaffoldBackgroundColor: Colors.white,
            // textTheme: Theme.of(context).textTheme.apply(bodyColor: TColor.primaryText, displayColor: TColor.primaryText),
            textTheme: TextTheme(
              displayLarge: TextStyle(color: Colors.black87, fontSize: 24.sp),
              displayMedium: TextStyle(color: Colors.black87, fontSize: 20.sp),
              bodyLarge: TextStyle(color: Colors.black87, fontSize: 16.sp),
              // 普通的 Text 控件如果不指定样式，会使用 bodyMedium 样式
              bodyMedium: TextStyle(color: Colors.white, fontSize: 14.sp),
              // 按钮文字颜色
              labelLarge: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: TColor.primary),
            useMaterial3: false,
            appBarTheme: AppBarTheme(
              toolbarHeight: 40,
              elevation: 0,
              backgroundColor: Colors.white, // AppBar背景色
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 18.sp), // AppBar标题样式
              iconTheme: IconThemeData(color: Colors.black), // AppBar图标颜色
            ),
          ),
        );
      },
    );
  }
}
