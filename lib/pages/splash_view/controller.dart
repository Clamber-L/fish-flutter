import 'package:flutter_fish/common/routers/names.dart';
import 'package:get/get.dart';

class SplashViewController extends GetxController {
  SplashViewController();

  void loadView() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offNamed(RouteNames.mainTabView);
  }

  _initData() {
    update(["splash_view"]);
  }

  void onTap() {}

  @override
  void onReady() {
    super.onReady();
    _initData();
    loadView();
  }
}
