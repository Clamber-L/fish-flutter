import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> with AutomaticKeepAliveClientMixin {
  final RecordLogic logic = Get.put(RecordLogic());
  final RecordState state = Get.find<RecordLogic>().state;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(body: SafeArea(child: Center(child: Text("record page", style: TextStyle(color: Colors.black)))));
  }

  @override
  void dispose() {
    Get.delete<RecordLogic>();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
