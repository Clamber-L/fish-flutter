import 'package:flutter_fish/common/index.dart';
import 'package:flutter_fish/common/utils/result/status_result.dart';
import 'package:flutter_fish/common/widgets/status_view.dart';
import 'package:get/get.dart';

import 'state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

  final fishRecordApi = FishRecordApi();
  @override
  void onReady() {
    super.onReady();
    getRecordList();
  }

  void getRecordList() async {
    StatusResult<List<FishRecord>> result = await fishRecordApi.list();
    state.fishRecord = result.data;
    state.isLoading = false;
    state.status = result.status; // 更新状态为成功
    update();
  }
}
