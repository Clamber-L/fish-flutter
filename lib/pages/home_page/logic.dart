import 'package:flutter_fish/common/index.dart';
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
    List<FishRecord> record = await fishRecordApi.list();
    state.fishRecord = record;
    state.isLoading = false;
    update();
  }
}
