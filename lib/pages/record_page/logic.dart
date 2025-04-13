import 'package:flutter_fish/common/api/fish_record/fish_record_api.dart';
import 'package:flutter_fish/common/models/fish_record.dart';
import 'package:flutter_fish/common/utils/result/status_result.dart';
import 'package:get/get.dart';

import 'state.dart';

class RecordLogic extends GetxController {
  final RecordState state = RecordState();
  final fishRecordApi = FishRecordApi();

  @override
  void onReady() {
    super.onReady();
    getRecordList();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // 获取收获列表
  void getRecordList() async {
    StatusPagerResult<FishRecord> result = await fishRecordApi.listPage(1, 5);
    state.status = result.status; // 更新状态
    state.fishRecord = result.data.items ?? [];
    state.isLoading = false;
    update();
  }
}
