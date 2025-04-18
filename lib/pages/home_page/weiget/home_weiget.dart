import 'package:flutter/material.dart';
import 'package:flutter_fish/common/index.dart';
import 'package:flutter_fish/pages/home_page/logic.dart';
import 'package:flutter_fish/pages/record_page/view/record_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class SummaryCard extends StatelessWidget {
  SummaryCard({super.key});

  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1, // 增加阴影深度
      color: TColor.primaryCard,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.sp)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.tips_and_updates,
                          color: Colors.white,
                          size: 20.h,
                        ),
                        SizedBox(width: 3.h),
                        Text(
                          "今日天气",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: TColor.secondaryText,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "26℃",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: TColor.secondaryText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/img/1.png',
                    color: Colors.yellow[300],
                    width: 40.h,
                    height: 40.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                cardStatItem("65%", "湿度", TColor.primaryCardSmall),
                SizedBox(width: 10.h),
                cardStatItem("3.2", "风速(m/s)", TColor.primaryCardSmall),
                SizedBox(width: 10.h),
                cardStatItem("22℃", "水温", TColor.primaryCardSmall),
              ],
            ),
            SizedBox(height: 10.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: Text(
                "光照强烈，气温较高，日间温差较大，中午鱼类容易上浮，但通常早晚“鱼口”较好。",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: TColor.secondaryText,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget historyRecord() {
  return Expanded(
    child: ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
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
                      Text(
                        "2025-03-28",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        margin: EdgeInsets.only(left: 4.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          "周末",
                          style: TextStyle(color: Colors.blue, fontSize: 12.sp),
                        ),
                      ),
                    ],
                  ),
                ),
                // 今日最大收获
                Row(
                  children: [
                    _todayBestCard(),
                    SizedBox(width: 6.h),
                    _todayBestCard(),
                    SizedBox(width: 6.h),
                    _todayBestCard(),
                  ],
                ),
                // 今日收获图片
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.network(
                      "https://cdn.pixabay.com/photo/2022/09/17/21/18/butterfly-7461850_1280.jpg",
                    ),
                  ),
                ),

                // 今日收获详情
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 16.r,
                      color: HexColor("#50AB8B"),
                    ),
                    SizedBox(width: 4.h),
                    Text(
                      '北京市朝阳区',
                      style: TextStyle(fontSize: 12.sp, color: Colors.black),
                    ),
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
  );
}

Widget _todayBestCard() {
  return Expanded(
    flex: 1,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.grey[200],
        border: Border.all(color: Colors.grey[200]!),
      ),
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

Widget dateSelect() {
  return Container(
    height: 50.h,
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: HexColor("#F0F0F0"))),
    ),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      itemCount: 7,
      itemBuilder: (context, index) {
        return Container(
          width: 80.h,
          margin: EdgeInsets.only(right: 8.h),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: index == 0 ? HexColor("#50AB8B") : Colors.transparent,
                width: 2.h,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${index + 1}日',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: index == 0 ? HexColor("#50AB8B") : HexColor("#666666"),
                ),
              ),
              Text(
                '周${['一', '二', '三', '四', '五', '六', '日'][index]}',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: index == 0 ? HexColor("#50AB8B") : HexColor("#999999"),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
