import 'package:get/get.dart';

import 'logic.dart';

class AddRecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddRecordLogic());
  }
}
