import 'package:flutter_fish/pages/record_page/logic.dart';
import 'package:get/get.dart';

class RecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecordLogic());
  }
}
