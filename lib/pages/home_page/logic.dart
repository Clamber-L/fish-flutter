import 'package:flutter/material.dart';
import 'package:flutter_fish/common/index.dart';
import 'package:flutter_fish/common/utils/result/status_result.dart';
import 'package:flutter_fish/common/widgets/status_view.dart';
import 'package:get/get.dart';

import 'state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

  final fishRecordApi = FishRecordApi();

  // 添加 PageController
  final PageController pageController = PageController();

  @override
  void onReady() {
    super.onReady();
    getRecordList();
  }

  // 修改 Tab 点击事件
  void changePage(int index) {
    state.currentPageIndex.value = index;
    pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  // 获取收获列表
  void getRecordList() async {
    StatusPagerResult<FishRecord> result = await fishRecordApi.listPage(1, 5);
    state.fishRecord = result.data.items ?? [];
    state.isLoading = false;
    state.status = result.status; // 更新状态为成功
    update();
  }
}
