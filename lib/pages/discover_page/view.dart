import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> with AutomaticKeepAliveClientMixin {
  final DiscoverLogic logic = Get.put(DiscoverLogic());
  final DiscoverState state = Get.find<DiscoverLogic>().state;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(body: SafeArea(child: Center(child: Text("discover page", style: TextStyle(color: Colors.black)))));
  }

  @override
  void dispose() {
    Get.delete<DiscoverLogic>();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
