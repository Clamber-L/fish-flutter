import 'package:flutter_fish/common/routers/names.dart';
import 'package:flutter_fish/pages/discover_page/binding.dart';
import 'package:flutter_fish/pages/discover_page/view.dart';
import 'package:flutter_fish/pages/home_page/binding.dart';
import 'package:flutter_fish/pages/home_page/view.dart';
import 'package:flutter_fish/pages/main_tab_view/bindings.dart';
import 'package:flutter_fish/pages/main_tab_view/view.dart';
import 'package:flutter_fish/pages/profile_page/binding.dart';
import 'package:flutter_fish/pages/profile_page/view.dart';
import 'package:flutter_fish/pages/record_page/binding.dart';
import 'package:flutter_fish/pages/record_page/view.dart';
import 'package:flutter_fish/pages/splash_view/view.dart';
import 'package:get/get.dart';

class RoutePages {
  // 列表
  static final List<GetPage> list = [
    GetPage(name: RouteNames.splashView, page: () => SplashViewPage()),
    GetPage(name: RouteNames.mainTabView, page: () => MainTabViewPage(), binding: MainTabViewBinding()),
    GetPage(name: RouteNames.homeView, page: () => HomePage(), binding: HomeBinding()),
    GetPage(name: RouteNames.recordView, page: () => RecordPage(), binding: RecordBinding()),
    GetPage(name: RouteNames.discoverView, page: () => DiscoverPage(), binding: DiscoverBinding()),
    GetPage(name: RouteNames.profileView, page: () => ProfilePage(), binding: ProfileBinding()),
  ];
}
