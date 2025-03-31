import 'package:flutter/material.dart';
import 'package:flutter_fish/pages/home_page/logic.dart';
import 'package:flutter_fish/pages/home_page/weiget/home_weiget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_fish/common/index.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        child: Column(
          children: [
            SizedBox(height: 8.h),
            SummaryCard(),
            SizedBox(height: 8.h),
            HarvestCard(),
            // 推荐
            SizedBox(height: 8.h),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: _recommendCard("技巧心得", "春季野钓技巧分享，掌握这些要点让你事半功倍", ""),
                ),
                Expanded(
                  flex: 1,
                  child: _recommendCard("技巧心得", "春季野钓技巧分享，掌握这些要点让你事半功倍", ""),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              alignment: Alignment.centerLeft,
              child: Text(
                "今日收获",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
            ),
            GetBuilder<HomeLogic>(
              init: HomeLogic(),
              builder: (builder) {
                Widget listView = ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.fishRecord!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: FishCard(record: state.fishRecord![index]),
                    );
                  },
                );
                return SkeletonStatus(
                  listView: listView,
                  stateStatus: state.status,
                  width: MediaQuery.of(context).size.width,
                  height: 150.h,
                  retry: logic.getRecordList,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _recommendCard(String title, String content, String toNamed) {
    return Card(
      elevation: 1, // 增加阴影深度
      color: TColor.secondaryCard,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.sp)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.lightbulb, color: Colors.white, size: 20.w),
                SizedBox(width: 3.w),
                Text(
                  "技巧心得",
                  style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.h),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
              child: Text(
                "春季野钓技巧分享，掌握这些要点让你事半功倍,掌握这些要点让你事半功倍，掌握这些要点让你事半功倍...",
                // overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: TextStyle(color: TColor.secondaryText, fontSize: 10.sp),
              ),
            ),
            SizedBox(height: 4.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Text(
                "查看详情",
                style: TextStyle(color: TColor.secondaryText, fontSize: 10.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
