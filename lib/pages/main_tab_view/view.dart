import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_fish/pages/discover_page/view.dart';
import 'package:flutter_fish/pages/home_page/view.dart';
import 'package:flutter_fish/pages/main_tab_view/controller.dart';
import 'package:flutter_fish/pages/profile_page/view.dart';
import 'package:flutter_fish/pages/record_page/view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainTabViewPage extends StatelessWidget {
  MainTabViewPage({super.key});

  final controller = Get.find<MainTabViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller.tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [HomePage(), RecordPage(), SizedBox(width: 1), DiscoverPage(), ProfilePage()],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 50.h,
        shape: const CircularNotchedRectangle(),
        child: Obx(() {
          return TabBar(
            padding: EdgeInsets.all(0),
            controller: controller.tabController,
            indicatorColor: Colors.transparent,
            tabs: [_barIcon(controller, 0, "首页"), _barIcon(controller, 1, "记录"), _addIcon(), _barIcon(controller, 3, "发现"), _barIcon(controller, 4, "我的")],
          );
        }),
      ),
    );
  }
}

Widget _barIcon(MainTabViewController controller, int index, String text) {
  return Center(
    child: Text(
      text,
      style: TextStyle(color: controller.state.selected.value == index ? Colors.black : Colors.grey, fontSize: 14.sp, fontWeight: FontWeight.bold),
    ),
  );
}

Widget _addIcon() {
  return GestureDetector(
    onTap: () => Get.snackbar("title", "message"),
    child: Transform.rotate(
      angle: -math.pi / 4,
      child: Container(
        width: 35.w,
        height: 35.w,
        decoration: BoxDecoration(
          // boxShadow: [BoxShadow(spreadRadius: 2, blurRadius: 15, offset: Offset(0, 1))],
          // color: Colors.black,
          border: Border.all(width: 2.w),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Transform.rotate(
          angle: -math.pi / 4,
          child: Center(
            //图标任你换
            child: Icon(Icons.add, color: Colors.black, size: 26.w),
          ),
        ),
      ),
    ),
  );
}
