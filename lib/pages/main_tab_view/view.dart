import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_fish/common/index.dart';
import 'package:flutter_fish/common/widgets/group_setting.dart';
import 'package:flutter_fish/common/widgets/status_view.dart';
import 'package:flutter_fish/pages/home_page/view.dart';
import 'package:flutter_fish/pages/main_tab_view/controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainTabViewPage extends StatefulWidget {
  MainTabViewPage({super.key});

  @override
  State<MainTabViewPage> createState() => _MainTabViewPageState();
}

class _MainTabViewPageState extends State<MainTabViewPage> {
  final MainTabViewController controller = Get.put(MainTabViewController());

  final List<Widget> _eachView = <Widget>[];

  int _index = 0;

  @override
  void initState() {
    _eachView.add(HomePage());
    _eachView.add(_center());
    super.initState();
  }

  Widget _center() {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Button(
            width: 300,
            color: Colors.purple,
            text: controller.state.text,
            icon: Icon(Icons.home),
            onTap: () {
              controller.oneUser();
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 0,
        backgroundColor: Colors.black,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Transform.rotate(
          angle: -math.pi / 4,
          child: Container(
            width: 50.w,
            height: 50.w,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 15,
                  offset: Offset(0, 1),
                ),
              ],
              color: Colors.black,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Transform.rotate(
              angle: -math.pi / 4,
              child: Center(
                //图标任你换
                child: Icon(Icons.add, color: Colors.white, size: 26.w),
              ),
            ),
          ),
        ),
      ),
      // body: TabBarView(
      //   controller: controller.tabController,
      //   children: [
      //     HomePage(),
      //     SafeArea(
      //       child: GetBuilder<MainTabViewController>(
      //         builder: (logic) {
      //           return Center(
      //             child: Button(
      //               width: 300,
      //               color: Colors.purple,
      //               text: controller.state.text,
      //               icon: Icon(Icons.home),
      //               onTap: () {
      //                 controller.oneUser();
      //               },
      //             ),
      //           );
      //         },
      //       ),
      //     ),
      //     GroupSetting(
      //       children: <Item>[
      //         Item.leading("hello world"),
      //         Item.customize(
      //           Container(
      //             alignment: Alignment.center,
      //             height: 100,
      //             color: Colors.blue,
      //             child: Text("第一项自定义"),
      //           ),
      //         ),
      //         Item.spacer(10),
      //         Item.text(
      //           title: "账号与安全",
      //           icon: Icon(Icons.tiktok),
      //           subtitle: "账号与安全子标题",
      //           description: "这里是描述信息",
      //         ),
      //         Item.switcher(title: "switcher"),
      //         Item.spacer(),
      //         Item.notification(
      //           title: "notification",
      //           onTap: () => Get.snackbar("title", "message"),
      //         ),
      //       ],
      //     ),
      //     StatusView(
      //       retry: controller.loading,
      //       controller: controller.statusViewController,
      //       status: Status.NETWORK_ERROR,
      //       builder:
      //           (context) => const Center(
      //             child: Text("测试页面", style: TextStyle(color: Colors.blue)),
      //           ),
      //     ),
      //   ],
      // ),
      bottomNavigationBar: BottomAppBar(
        height: 50.h,
        shape: const CircularNotchedRectangle(),
        color: Colors.blue,
        elevation: 0,
        //
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _index = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.airplay),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _index = 1;
                });
              },
            ),
          ],
        ),
      ),
      body: _eachView[_index],
    );
  }
}

Widget _barIcon(MainTabViewController controller, int index, String text) {
  return Center(
    child: Text(
      text,
      style: TextStyle(
        color:
            controller.state.selected.value == index
                ? Colors.black
                : Colors.grey[600],
        fontSize: 14.sp,
      ),
    ),
  );
}
