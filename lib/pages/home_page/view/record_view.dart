// import 'package:easy_refresh/easy_refresh.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_fish/common/index.dart';
// import 'package:flutter_fish/pages/home_page/logic.dart';
// import 'package:flutter_fish/pages/home_page/weiget/home_weiget.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// class RecordView extends StatefulWidget {
//   const RecordView({super.key});
//
//   @override
//   State<RecordView> createState() => _RecordViewState();
// }
//
// class _RecordViewState extends State<RecordView> {
//   final logic = Get.find<HomeLogic>();
//   final state = Get.find<HomeLogic>().state;
//
//   @override
//   Widget build(BuildContext context) {
//     return Placeholder();
//     // return Padding(
//     //   padding: EdgeInsets.symmetric(horizontal: 12.h),
//     //   child: SingleChildScrollView(
//     //     physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
//     //     child: Column(
//     //       children: [
//     //         SizedBox(height: 8.h),
//     //         HarvestCard(),
//     //         SizedBox(height: 8.h),
//     //         // 最佳收获
//     //         Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [_bestCard(), SizedBox(width: 2.h), _bestCard()]),
//     //         // todo! 日期选择器
//     //         // todo! 记录列表
//     //         SizedBox(height: 8.h),
//     //         // Container(
//     //         //   padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
//     //         //   alignment: Alignment.centerLeft,
//     //         //   child: Text("今日收获", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
//     //         // ),
//     //         GetBuilder<HomeLogic>(
//     //           init: HomeLogic(),
//     //           builder: (builder) {
//     //             Widget listView = EasyRefresh(
//     //               onRefresh: () async {},
//     //               onLoad: () async {},
//     //               child: ListView.builder(
//     //                 shrinkWrap: true,
//     //                 physics: const NeverScrollableScrollPhysics(),
//     //                 itemCount: state.fishRecord!.length,
//     //                 itemBuilder: (context, index) {
//     //                   return FishCard(record: state.fishRecord![index]);
//     //                 },
//     //               ),
//     //             );
//     //             return SkeletonStatus(
//     //               listView: listView,
//     //               stateStatus: state.status,
//     //               width: MediaQuery.of(context).size.width,
//     //               height: 150.h,
//     //               retry: logic.getRecordList,
//     //             );
//     //           },
//     //         ),
//     //       ],
//     //     ),
//     //   ),
//     // );
//   }
//
//   Widget _bestCard() {
//     return Expanded(
//       flex: 1,
//       child: Card(
//         elevation: 1, // 增加阴影深度
//         color: TColor.secondaryCard,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.sp)),
//         child: Padding(
//           padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text("最佳今日钓获", style: TextStyle(fontSize: 13.sp, color: TColor.secondaryText)),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 10.h),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.h),
//                       decoration: BoxDecoration(color: TColor.secondaryCardSmall, borderRadius: BorderRadius.circular(10.sp)),
//                       child: Column(
//                         children: [
//                           Text("12", style: TextStyle(fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.bold)),
//                           Text("条数", style: TextStyle(fontSize: 12.sp, color: Colors.white)),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.h),
//                       decoration: BoxDecoration(color: TColor.secondaryCardSmall, borderRadius: BorderRadius.circular(10.sp)),
//                       child: Column(
//                         children: [
//                           Text("8.5", style: TextStyle(fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.bold)),
//                           Text("公斤", style: TextStyle(fontSize: 12.sp, color: Colors.white)),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
