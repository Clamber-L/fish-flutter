import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'logic.dart';
import 'state.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with AutomaticKeepAliveClientMixin<ProfilePage> {
  final ProfileLogic logic = Get.find();
  final ProfileState state = Get.find<ProfileLogic>().state;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        // 中间我的成就
        // 底部其他信息
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: Column(
            children: [
              // 头部人物资料信息
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                decoration: BoxDecoration(color: HexColor("#50AB8B"), borderRadius: BorderRadius.circular(12.r)),
                child: Row(
                  children: [
                    // 头像
                    CircleAvatar(
                      radius: 40.r,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2017/05/31/00/24/aquarium-2358739_1280.jpg"),
                    ),
                    SizedBox(width: 20.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("陈师傅", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
                          SizedBox(height: 5.h),
                          Row(
                            children: [
                              Text("钓鱼老手", style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400)),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5.w),
                                child: SizedBox(width: 1, height: 12, child: DecoratedBox(decoration: BoxDecoration(color: Colors.grey[300]))),
                              ),
                              Text("已钓鱼384天", style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400)),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r), color: Colors.white.withAlpha(50)),
                                child: Text("钓鱼283天", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // 修改中间成就部分和添加底部信息
              Column(
                children: [
                  // 中间我的成就
                  Container(
                    margin: EdgeInsets.only(top: 20.h),
                    padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6.r, offset: Offset(0, 2.h))],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("我的成就", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: HexColor("#333333"))),
                        SizedBox(height: 12.h),
                        GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 4,
                          mainAxisSpacing: 8.h, // Reduced from 12.h
                          crossAxisSpacing: 8.w, // Reduced from 12.w
                          children: List.generate(8, (index) {
                            return Column(
                              children: [
                                Container(
                                  width: 45.r, // Reduced from 50.r
                                  height: 45.r, // Reduced from 50.r
                                  decoration: BoxDecoration(
                                    color: HexColor("#E8F5EE"),
                                    borderRadius: BorderRadius.circular(22.5.r), // Adjusted for new size
                                  ),
                                  child: Icon(Icons.star, color: HexColor("#50AB8B"), size: 20.r),
                                ),
                                SizedBox(height: 4.h), // Reduced from 6.h
                                Text(
                                  "成就${index + 1}",
                                  style: TextStyle(
                                    fontSize: 10.sp, // Reduced from 12.sp
                                    color: HexColor("#333333"),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ],
                    ),
                  ),

                  // 底部其他信息
                  Container(
                    margin: EdgeInsets.only(top: 20.h),
                    padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6.r, offset: Offset(0, 2.h))],
                    ),
                    child: Column(
                      children: [
                        _buildMenuItem(Icons.settings, "系统设置"),
                        _buildMenuItem(Icons.history, "钓鱼记录"),
                        _buildMenuItem(Icons.favorite, "我的收藏"),
                        _buildMenuItem(Icons.help_outline, "帮助中心"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<ProfileLogic>();
    super.dispose();
  }
}

// 添加底部菜单项构建方法
Widget _buildMenuItem(IconData icon, String title) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 12.h),
    child: Row(
      children: [
        Icon(icon, color: HexColor("#50AB8B"), size: 24.r),
        SizedBox(width: 16.w),
        Text(title, style: TextStyle(fontSize: 16.sp, color: Colors.black)),
        Spacer(),
        Icon(Icons.chevron_right, color: Colors.grey, size: 20.r),
      ],
    ),
  );
}
