import 'package:flutter/material.dart';
import 'package:flutter_fish/pages/home_page/view/home_view.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // 在 HomePage build 方法中修改外层布局
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // 固定在顶部的Row
            // Padding(
            //   padding: EdgeInsets.only(left: 12.h, right: 12.h, top: 10.h),
            //   child: Row(
            //     children: [
            //       // 首页 Tab
            //       GestureDetector(onTap: () => logic.changePage(0), child: Obx(() => _tabContainer("首页", 0))),
            //       // 记录 Tab
            //       GestureDetector(onTap: () => logic.changePage(1), child: Obx(() => _tabContainer("记录", 1))),
            //       // 测试页面
            //       GestureDetector(onTap: () => Get.offNamed(RouteNames.loginView), child: Text("返回", style: TextStyle(color: TColor.bg))),
            //     ],
            //   ),
            // ),
            // 区域可切换页面
            HomeView(),

            // Expanded(
            //   child: PageView(
            //     controller: logic.pageController,
            //     physics: const NeverScrollableScrollPhysics(), // 禁用手动滑动
            //     onPageChanged: (index) => state.currentPageIndex.value = index,
            //     children: [
            //       // 首页内容
            //       HomeView(),
            //       // 记录页内容
            //       RecordView(), // 确保已导入 RecordPage
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // Widget _tabContainer(String title, int index) {
  //   return Container(
  //     padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.h),
  //     decoration: BoxDecoration(border: Border(bottom: BorderSide(color: state.currentPageIndex.value == index ? Colors.blue : Colors.transparent, width: 2))),
  //     child: Text(
  //       title,
  //       style: TextStyle(fontSize: 14.sp, color: state.currentPageIndex.value == index ? Colors.blue : Colors.black, fontWeight: FontWeight.w400),
  //     ),
  //   );
  // }

  @override
  void dispose() {
    Get.delete<HomeLogic>();
    super.dispose();
  }
}
