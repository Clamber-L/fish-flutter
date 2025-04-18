import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter_fish/common/api/fish_record/fish_record_api.dart';
import 'package:flutter_fish/common/models/fish_record.dart';
import 'package:flutter_fish/common/utils/result/pager.dart';
import 'package:flutter_fish/common/utils/result/status_result.dart';
import 'package:get/get.dart';

import 'state.dart';

class RecordLogic extends GetxController {
  final RecordState state = RecordState();
  final fishRecordApi = FishRecordApi();

  final EasyRefreshController controller = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );

  @override
  void onReady() {
    super.onReady();
    initRecordList(1);
  }

  @override
  void onClose() {
    super.onClose();
  }

  void initRecordList(int page) async {
    state.result = await fishRecordApi.listPage(page: 1);
    state.status = state.result.status; // 更新状态
    state.fishRecord = state.result.data.items;
    state.isLoading = false;
    state.isNoMore = state.result.data.page >= state.result.data.totalPage;
    update();
  }

  // 获取收获列表
  void getRecordList() async {
    state.result = await fishRecordApi.listPage(
      page: state.result.data.page + 1,
    );
    if (state.result.data.items!.isNotEmpty) {
      state.fishRecord!.addAll(state.result.data.items!);
    }

    state.isNoMore = state.result.data.page >= state.result.data.totalPage;
    controller.finishLoad(
      state.isNoMore ? IndicatorResult.noMore : IndicatorResult.success,
    );
    update();
  }
}
