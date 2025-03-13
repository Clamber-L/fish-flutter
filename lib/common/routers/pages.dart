import 'package:flutter_fish/common/routers/names.dart';
import 'package:flutter_fish/pages/main_tab_view/bindings.dart';
import 'package:flutter_fish/pages/main_tab_view/view.dart';
import 'package:flutter_fish/pages/splash_view/view.dart';
import 'package:get/get.dart';

class RoutePages {
  // 列表
  static final List<GetPage> list = [
    GetPage(name: RouteNames.splashView, page: () => SplashViewPage()),
    GetPage(
      name: RouteNames.mainTabView,
      page: () => MainTabViewPage(),
      binding: MainTabViewBinding(),
    ),
  ];
}
