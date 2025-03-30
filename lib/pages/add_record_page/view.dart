import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class AddRecordPage extends StatefulWidget {
  const AddRecordPage({super.key});

  @override
  State<AddRecordPage> createState() => _AddRecordPageState();
}

class _AddRecordPageState extends State<AddRecordPage> with AutomaticKeepAliveClientMixin {
  final AddRecordLogic logic = Get.put(AddRecordLogic());
  final AddRecordState state = Get.find<AddRecordLogic>().state;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('添加收获'),
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back_ios_new, size: 20)),
      ),
      body: SafeArea(child: Container()),
    );
  }

  @override
  void dispose() {
    Get.delete<AddRecordLogic>();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
