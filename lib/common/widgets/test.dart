import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});
  // SafeArea(
  //   child: GetBuilder<MainTabViewController>(
  //     builder: (logic) {
  //       return Center(
  //         child: Button(
  //           width: 300,
  //           color: Colors.purple,
  //           text: controller.state.text,
  //           icon: Icon(Icons.home),
  //           onTap: () {
  //             controller.oneUser();
  //           },
  //         ),
  //       );
  //     },
  //   ),
  // ),
  // GroupSetting(
  //   children: <Item>[
  //     Item.leading("hello world"),
  //     Item.customize(Container(alignment: Alignment.center, height: 100, color: Colors.blue, child: Text("第一项自定义"))),
  //     Item.spacer(10),
  //     Item.text(title: "账号与安全", icon: Icon(Icons.tiktok), subtitle: "账号与安全子标题", description: "这里是描述信息"),
  //     Item.switcher(title: "switcher"),
  //     Item.spacer(),
  //     Item.notification(title: "notification", onTap: () => Get.snackbar("title", "message")),
  //   ],
  // ),
  // StatusView(
  //   retry: controller.loading,
  //   controller: controller.statusViewController,
  //   status: Status.NETWORK_ERROR,
  //   builder: (context) => const Center(child: Text("测试页面", style: TextStyle(color: Colors.blue))),
  // ),

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
