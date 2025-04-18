import 'package:flutter/material.dart';
import 'package:flutter_fish/common/index.dart';
import 'package:flutter_fish/common/widgets/refresh_list.dart';
import 'package:flutter_fish/pages/record_page/logic.dart';
import 'package:flutter_fish/pages/record_page/state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RecordView extends StatefulWidget {
  const RecordView({super.key});

  @override
  State<RecordView> createState() => _RecordViewState();
}

class _RecordViewState extends State<RecordView> {
  final RecordLogic logic = Get.find<RecordLogic>();
  final RecordState state = Get.find<RecordLogic>().state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('今日收获'),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.h),
          child: GetBuilder<RecordLogic>(
            init: RecordLogic(),
            builder: (builder) {
              // Widget listView = EasyRefresh(
              //   controller: logic.controller,
              //   // 是否首次自动触发下拉刷新
              //   refreshOnStart: true,
              //   // 是否在刷新后重置
              //   resetAfterRefresh: true,
              //   // 下拉刷新组件配置
              //   header: ClassicHeader(
              //     spacing: 5,
              //     showText: true,
              //     showMessage: false,
              //     dragText: '下拉以刷新',
              //     armedText: '释放开始刷新',
              //     readyText: '刷新中',
              //     processingText: '刷新中',
              //     processedText: '刷新成功',
              //     noMoreText: '没有更多数据',
              //     failedText: '加载失败',
              //     progressIndicatorSize: 14,
              //     triggerOffset: 40,
              //     textStyle: TextStyle(fontSize: 12),
              //   ),
              //   footer: ClassicFooter(
              //     spacing: 5,
              //     showText: true,
              //     showMessage: false,
              //     noMoreText: '-- 我是有底线的，没有更多了 --',
              //     progressIndicatorSize: 14,
              //     triggerOffset: 40,
              //     textStyle: const TextStyle(
              //       fontSize: 12,
              //       color: Colors.black38,
              //     ),
              //   ),
              //   onRefresh: () async {
              //     logic.initRecordList();
              //   },
              //   onLoad: () async {
              //     logic.getRecordList();
              //   },
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     itemCount: state.fishRecord!.length,
              //     itemBuilder: (context, index) {
              //       return FishCard(record: state.fishRecord![index]);
              //     },
              //   ),
              // );
              // return SkeletonStatus(
              //   listView: listView,
              //   stateStatus: state.status,
              //   width: MediaQuery.of(context).size.width,
              //   height: 150.h,
              //   retry: () => logic.initRecordList(),
              // );
              return RefreshList<FishRecord>(
                items: logic.state.result, // 假设初始页码为 1，可根据实际情况调整
                noMore: logic.state.isNoMore,
                builder: (BuildContext context, int index, FishRecord model) {
                  return FishCard(record: model);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class HarvestCard extends StatelessWidget {
  HarvestCard({super.key});

  final logic = Get.find<RecordLogic>();
  final state = Get.find<RecordLogic>().state;

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
                    Text(
                      "今日收获",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                        color: TColor.secondaryText,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(RouteNames.recordListView),
                  child: Text(
                    "查看更多收获>",
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w300,
                      color: TColor.secondaryText,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                cardStatItem("5", "总数量", TColor.primaryCardSmall),
                SizedBox(width: 10.h),
                cardStatItem("2.8", "总重量(kg)", TColor.primaryCardSmall),
                SizedBox(width: 10.h),
                cardStatItem("2", "时长(h)", TColor.primaryCardSmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget cardStatItem(String title, String value, Color color) {
  return Expanded(
    flex: 1,
    child: Container(
      padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              letterSpacing: 0.8,
            ),
          ),
        ],
      ),
    ),
  );
}

class FishCard extends StatelessWidget {
  final FishRecord record;

  FishCard({super.key, required this.record});

  final logic = Get.find<RecordLogic>();
  final state = Get.find<RecordLogic>().state;

  void _showImagePreview(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.all(20),
            child: InteractiveViewer(
              panEnabled: true,
              minScale: 0.5,
              maxScale: 4.0,
              child: ClipRRect(
                child: Image.network(record.imageUrl, fit: BoxFit.fill),
              ),
            ),
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
                Text(
                  record.time,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    color: Colors.grey[700],
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 20,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 4.h),
                    Text(
                      record.address,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 10.sp,
                      ),
                    ),
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
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(25),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child:
                            state.isLoading
                                ? Image.asset("assets/img/1.png")
                                : Image.network(
                                  record.imageUrl,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                ),
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
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        height: 2,
                        width: 24,
                        color: TColor.primaryText.withAlpha(51),
                      ),
                      SizedBox(height: 6.h),
                      _buildInfoRow(
                        Icons.eco_rounded,
                        record.bait,
                        Colors.grey[600]!,
                      ),
                      SizedBox(height: 8.h),
                      _buildInfoRow(
                        Icons.balance_outlined,
                        "${record.weight}kg",
                        Colors.grey[600]!,
                      ),
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
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: value,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
