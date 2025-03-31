import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'logic.dart';
import 'state.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> with AutomaticKeepAliveClientMixin {
  final DiscoverLogic logic = Get.put(DiscoverLogic());
  final DiscoverState state = Get.find<DiscoverLogic>().state;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // 顶部搜索栏
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.h),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: HexColor("#E5E5E4")),
                        color: HexColor("#F5F5F5"),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '搜索钓鱼地点、鱼种...',
                          prefixIcon: Icon(Icons.search, size: 20.r),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.h),
                  Icon(Icons.notifications_none, size: 24.r),
                ],
              ),
            ),

            // 分类标签
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: SizedBox(
                height: 40.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 12.h),
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      decoration: BoxDecoration(
                        color: index == 0 ? HexColor("#50AB8B") : Colors.transparent,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: index == 0 ? Colors.transparent : HexColor("#E5E5E5")),
                      ),
                      child: Center(
                        child: Text(
                          ["全部", "淡水", "海钓", "路亚", "装备", "技巧"][index],
                          style: TextStyle(color: index == 0 ? Colors.white : HexColor("#666666"), fontSize: 14.sp),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // 内容列表
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 16.h, left: 16.h, right: 16.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6.r, offset: Offset(0, 2.h))],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                          child: Image.network(
                            'https://cdn.pixabay.com/photo/2022/11/02/05/53/cycling-7564103_1280.jpg',
                            height: 180.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('优质钓点推荐 ${index + 1}', style: TextStyle(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.bold)),
                              SizedBox(height: 8.h),
                              Row(
                                children: [
                                  Icon(Icons.location_on, size: 16.r, color: HexColor("#50AB8B")),
                                  SizedBox(width: 4.h),
                                  Text('北京市朝阳区', style: TextStyle(fontSize: 12.sp, color: Colors.black)),
                                  Spacer(),
                                  Icon(Icons.favorite_border, size: 18.r, color: HexColor("#999999")),
                                  SizedBox(width: 4.h),
                                  Text('128', style: TextStyle(fontSize: 12.sp, color: Colors.black)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<DiscoverLogic>();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
