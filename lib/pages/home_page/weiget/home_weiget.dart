import 'package:flutter/material.dart';
import 'package:flutter_fish/pages/home_page/logic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_fish/common/index.dart';

class SummaryCard extends StatelessWidget {
  SummaryCard({super.key});
  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1, // 增加阴影深度
      color: Colors.blue[900],
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
                    Text("今日天气", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300)),
                    SizedBox(height: 12.h),
                    Text("26℃", style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/img/1.png', color: Colors.yellow[300], width: 40.w, height: 40.h, fit: BoxFit.cover),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem("65%", "湿度", Colors.blue[700]!),
                SizedBox(width: 10.w),
                _buildStatItem("3.2", "风速(m/s)", Colors.blue[700]!),
                SizedBox(width: 10.w),
                _buildStatItem("22℃", "水温", Colors.blue[700]!),
              ],
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
      elevation: 1, // 增加阴影深度
      color: Colors.green[600],
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
                Text("今日收获", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300)),
                Text("查看更多", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300)),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem("5", "总数量", Colors.green[400]!),
                SizedBox(width: 10.w),
                _buildStatItem("2.8", "总重量(kg)", Colors.green[400]!),
                SizedBox(width: 10.w),
                _buildStatItem("2", "时长(h)", Colors.green[400]!),
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
          Text(title, style: TextStyle(fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.w700)),
          const SizedBox(height: 4),
          Text(value, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: 0.8)),
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(record.time, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11, color: Colors.grey[700])),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined, size: 12, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(record.address, style: TextStyle(color: Colors.grey[600], fontSize: 9)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: GestureDetector(
                    onTap: () => _showImagePreview(context),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(color: Colors.black.withAlpha(25), blurRadius: 8, offset: const Offset(0, 4))],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
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
                          fontSize: 18, // 减小字号
                          fontWeight: FontWeight.w700,
                          color: TColor.primary.withAlpha(240),
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(height: 2, width: 24, color: TColor.primary.withAlpha(51), margin: const EdgeInsets.only(bottom: 4)),
                      _buildInfoRow(Icons.eco_rounded, "饵料", record.bait, Colors.grey[600]!),
                      const SizedBox(height: 8),
                      _buildInfoRow(Icons.balance_outlined, "重量", record.weight, Colors.grey[600]!),
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

  Widget _buildInfoRow(IconData icon, String label, String value, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 6),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: "$label\n", style: TextStyle(fontSize: 10, color: color.withAlpha(150), height: 1.4)),
              TextSpan(text: value, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: color)),
            ],
          ),
        ),
      ],
    );
  }
}
