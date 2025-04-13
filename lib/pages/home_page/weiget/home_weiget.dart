import 'package:flutter/material.dart';
import 'package:flutter_fish/common/index.dart';
import 'package:flutter_fish/pages/home_page/logic.dart';
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
                        Icon(Icons.tips_and_updates, color: Colors.white, size: 20.h),
                        SizedBox(width: 3.h),
                        Text("今日天气", style: TextStyle(fontSize: 12.sp, color: TColor.secondaryText, fontWeight: FontWeight.w300)),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Text("26℃", style: TextStyle(fontSize: 20.sp, color: TColor.secondaryText, fontWeight: FontWeight.bold)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/img/1.png', color: Colors.yellow[300], width: 40.h, height: 40.h, fit: BoxFit.cover),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem("65%", "湿度", TColor.primaryCardSmall),
                SizedBox(width: 10.h),
                _buildStatItem("3.2", "风速(m/s)", TColor.primaryCardSmall),
                SizedBox(width: 10.h),
                _buildStatItem("22℃", "水温", TColor.primaryCardSmall),
              ],
            ),
            SizedBox(height: 10.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: Text(
                "光照强烈，气温较高，日间温差较大，中午鱼类容易上浮，但通常早晚“鱼口”较好。",
                style: TextStyle(fontSize: 12.sp, color: TColor.secondaryText, fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HarvestCard extends StatelessWidget {
  HarvestCard({super.key});

  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2, // 增加阴影深度
      color: TColor.primaryCard,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.sp)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.wine_bar_sharp, color: Colors.white, size: 20.h),
                    SizedBox(width: 3.h),
                    Text("今日收获", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300, color: TColor.secondaryText)),
                  ],
                ),
                GestureDetector(
                  onTap: () => {},
                  child: Text("查看更多收获>", style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w300, color: TColor.secondaryText)),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem("5", "总数量", TColor.primaryCardSmall),
                SizedBox(width: 10.h),
                _buildStatItem("2.8", "总重量(kg)", TColor.primaryCardSmall),
                SizedBox(width: 10.h),
                _buildStatItem("2", "时长(h)", TColor.primaryCardSmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildStatItem(String title, String value, Color color) {
  return Expanded(
    flex: 1,
    child: Container(
      padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.all(Radius.circular(10.r))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.w600)),
          Text(value, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: Colors.white, letterSpacing: 0.8)),
        ],
      ),
    ),
  );
}

class FishCard extends StatelessWidget {
  final FishRecord record;

  FishCard({super.key, required this.record});

  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;

  void _showImagePreview(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.all(20),
            child: InteractiveViewer(panEnabled: true, minScale: 0.5, maxScale: 4.0, child: ClipRRect(child: Image.network(record.imageUrl, fit: BoxFit.fill))),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(record.time, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp, color: Colors.grey[700])),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined, size: 20, color: Colors.grey),
                    SizedBox(width: 4.h),
                    Text(record.address, style: TextStyle(color: Colors.grey[600], fontSize: 10.sp)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: GestureDetector(
                    onTap: () => _showImagePreview(context),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [BoxShadow(color: Colors.black.withAlpha(25), blurRadius: 8, offset: const Offset(0, 4))],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child:
                            state.isLoading
                                ? Image.asset("assets/img/1.png")
                                : Image.network(record.imageUrl, fit: BoxFit.cover, alignment: Alignment.topCenter),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // 右侧信息区域
                Expanded(
                  flex: 4, // 缩小右侧比例
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        record.type,
                        style: TextStyle(
                          fontSize: 18.sp, // 减小字号
                          fontWeight: FontWeight.w700,
                          color: TColor.primaryText.withAlpha(240),
                          height: 1.2,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Container(padding: EdgeInsets.symmetric(vertical: 5.h), height: 2, width: 24, color: TColor.primaryText.withAlpha(51)),
                      SizedBox(height: 6.h),
                      _buildInfoRow(Icons.eco_rounded, record.bait, Colors.grey[600]!),
                      SizedBox(height: 8.h),
                      _buildInfoRow(Icons.balance_outlined, "${record.weight}kg", Colors.grey[600]!),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String value, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 6),
        RichText(text: TextSpan(children: [TextSpan(text: value, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: color))])),
      ],
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
                Row(children: [_todayBestCard(), SizedBox(width: 6.h), _todayBestCard(), SizedBox(width: 6.h), _todayBestCard()]),
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
                    SizedBox(width: 4.h),
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
  );
}

Widget _todayBestCard() {
  return Expanded(
    flex: 1,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.h),
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

Widget dateSelect() {
  return Container(
    height: 50.h,
    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: HexColor("#F0F0F0")))),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      itemCount: 7,
      itemBuilder: (context, index) {
        return Container(
          width: 80.h,
          margin: EdgeInsets.only(right: 8.h),
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
  );
}
