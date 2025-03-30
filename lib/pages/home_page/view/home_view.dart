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
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        child: Column(
          children: [
            SizedBox(height: 8.h),
            SummaryCard(),
            SizedBox(height: 8.h),
            HarvestCard(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              alignment: Alignment.centerLeft,
              child: Text("今日收获", style: TextStyle(fontSize: 14.sp, color: Colors.grey, fontWeight: FontWeight.bold)),
            ),
            GetBuilder<HomeLogic>(
              init: HomeLogic(),
              builder: (builder) {
                Widget listView = ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.fishRecord!.length,
                  itemBuilder: (context, index) {
                    return Padding(padding: const EdgeInsets.only(bottom: 10), child: FishCard(record: state.fishRecord![index]));
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
}
