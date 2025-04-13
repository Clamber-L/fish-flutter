import 'package:flutter/material.dart';
import 'package:flutter_fish/pages/record_page/logic.dart';
import 'package:flutter_fish/pages/record_page/state.dart';
import 'package:get/get.dart';

class RecordView extends StatefulWidget {
  const RecordView({super.key});

  @override
  State<RecordView> createState() => _RecordViewState();
}

class _RecordViewState extends State<RecordView> {
  final RecordLogic logic = Get.find<RecordLogic>();
  final RecordState state = Get.find<RecordLogic>().state;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
