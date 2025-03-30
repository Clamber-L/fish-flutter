import 'package:flutter/material.dart';
import 'package:flutter_fish/common/widgets/button.dart';
import 'package:flutter_fish/pages/home_page/weiget/home_weiget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'logic.dart';
import 'state.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> with AutomaticKeepAliveClientMixin {
  final RecordLogic logic = Get.find<RecordLogic>();
  final RecordState state = Get.find<RecordLogic>().state;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              SizedBox(height: 8.h),
              // 收获卡片
              SummaryCard(),
              // 最佳收获
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [_bestCard(), SizedBox(width: 2.w), _bestCard()],
              ),
              // 日期选择器
              Container(
                height: 50.h,
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: HexColor("#F0F0F0")))),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 80.w,
                      margin: EdgeInsets.only(right: 8.w),
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: index == 0 ? HexColor("#50AB8B") : Colors.transparent, width: 2.h))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${index + 1}日', style: TextStyle(fontSize: 14.sp, color: index == 0 ? HexColor("#50AB8B") : HexColor("#666666"))),
                          Text(
                            '周${['一', '二', '三', '四', '五', '六', '日'][index]}',
                            style: TextStyle(fontSize: 12.sp, color: index == 0 ? HexColor("#50AB8B") : HexColor("#999999")),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // 记录列表
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 日期
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 6.h),
                              child: Row(
                                children: [
                                  Text("2025-03-28", style: TextStyle(color: Colors.black, fontSize: 15.sp, fontWeight: FontWeight.bold)),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                                    margin: EdgeInsets.only(left: 4.0),
                                    decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(8.r)),
                                    child: Text("周末", style: TextStyle(color: Colors.blue, fontSize: 12.sp)),
                                  ),
                                ],
                              ),
                            ),
                            // 今日最大收获
                            Row(children: [_todayBestCard(), SizedBox(width: 6.w), _todayBestCard(), SizedBox(width: 6.w), _todayBestCard()]),
                            // 今日收获图片
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16.r),
                                child: Image.network("https://cdn.pixabay.com/photo/2022/09/17/21/18/butterfly-7461850_1280.jpg"),
                              ),
                            ),

                            // 今日收获详情
                            Row(
                              children: [
                                Icon(Icons.location_on, size: 16.r, color: HexColor("#50AB8B")),
                                SizedBox(width: 4.w),
                                Text('北京市朝阳区', style: TextStyle(fontSize: 12.sp, color: Colors.black)),
                                Spacer(),
                                Button(text: "查看详情"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<RecordLogic>();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  Widget _todayBestCard() {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r), color: Colors.grey[200], border: Border.all(color: Colors.grey[200]!)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 日期
            Text("总条数", style: TextStyle(color: Colors.black)),
            SizedBox(height: 2.h),
            Text("6条", style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }

  Widget _bestCard() {
    return Expanded(
      flex: 1,
      child: Card(
        elevation: 1, // 增加阴影深度
        color: Colors.green[500],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.sp)),
        child: Padding(
          padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("最佳今日钓获", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("12", style: TextStyle(fontSize: 20.sp, color: Colors.white, fontWeight: FontWeight.bold)),
                        Text("条数", style: TextStyle(fontSize: 16.sp, color: Colors.white)),
                      ],
                    ),
                    Column(
                      children: [
                        Text("8.5", style: TextStyle(fontSize: 20.sp, color: Colors.white, fontWeight: FontWeight.bold)),
                        Text("公斤", style: TextStyle(fontSize: 16.sp, color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
