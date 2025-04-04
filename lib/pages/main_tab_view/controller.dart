import 'package:flutter/material.dart';
import 'package:flutter_fish/common/index.dart';
import 'package:flutter_fish/common/widgets/status_view.dart';
import 'package:flutter_fish/pages/main_tab_view/state.dart';
import 'package:get/get.dart';

class MainTabViewController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final state = MainTabViewState();
  final userApi = UserApi();
  late final StatusViewController statusViewController;

  MainTabViewController();

  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    // 初始化 TabController
    tabController = TabController(length: 5, vsync: this);
    tabController.addListener(() {
      state.selected.value = tabController.index; // 使用 Rx 更新 selected 值
    });
    statusViewController = StatusViewController();
  }

  @override
  void onClose() {
    tabController.dispose(); // 销毁 TabController，防止内存泄漏
    super.onClose();
  }

  // void oneUser() async {
  //   User user = await userApi.getOne();
  //   state.text = user.username;
  //   update();
  // }

  void loading() {
    statusViewController.showLoading();
    Future.delayed(const Duration(seconds: 2), statusViewController.loaded);
  }
}
