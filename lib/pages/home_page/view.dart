import 'package:flutter/material.dart';
import 'package:flutter_fish/common/index.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeLogic logic = Get.put(HomeLogic());
  final HomeState state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    final List<FishRecord> records = [
      FishRecord(
        time: "上午 09:30",
        type: "草鱼",
        weight: "1.2kg",
        bait: "玉米粒",
        imageUrl:
            "https://cdn.pixabay.com/photo/2014/05/08/15/56/rainbow-trout-340352_640.jpg",
        address: "南湖水库",
      ),
      FishRecord(
        time: "上午 11:15",
        type: "鲫鱼",
        weight: "0.8kg",
        bait: "虾饵",
        imageUrl:
            "https://cdn.pixabay.com/photo/2014/05/08/15/56/rainbow-trout-340352_640.jpg",
        address: "南湖水库",
      ),
      FishRecord(
        time: "下午 14:45",
        type: "鲤鱼",
        weight: "1.5kg",
        bait: "红虫",
        imageUrl:
            "https://cdn.pixabay.com/photo/2014/05/08/15/56/rainbow-trout-340352_640.jpg",
        address: "南湖水库",
      ),
      FishRecord(
        time: "下午 14:45",
        type: "鲤鱼",
        weight: "1.5kg",
        bait: "红虫",
        imageUrl:
            "https://cdn.pixabay.com/photo/2014/05/08/15/56/rainbow-trout-340352_640.jpg",
        address: "南湖水库",
      ),
      FishRecord(
        time: "下午 14:45",
        type: "鲤鱼",
        weight: "1.5kg",
        bait: "红虫",
        imageUrl:
            "https://cdn.pixabay.com/photo/2014/05/08/15/56/rainbow-trout-340352_640.jpg",
        address: "南湖水库",
      ),
      FishRecord(
        time: "下午 14:45",
        type: "鲤鱼",
        weight: "1.5kg",
        bait: "红虫",
        imageUrl:
            "https://cdn.pixabay.com/photo/2014/05/08/15/56/rainbow-trout-340352_640.jpg",
        address: "南湖水库",
      ),
      FishRecord(
        time: "下午 14:45",
        type: "鲤鱼",
        weight: "1.5kg",
        bait: "红虫",
        imageUrl:
            "https://cdn.pixabay.com/photo/2014/05/08/15/56/rainbow-trout-340352_640.jpg",
        address: "南湖水库",
      ),
      FishRecord(
        time: "下午 14:45",
        type: "鲤鱼",
        weight: "1.5kg",
        bait: "红虫",
        imageUrl:
            "https://cdn.pixabay.com/photo/2014/05/08/15/56/rainbow-trout-340352_640.jpg",
        address: "南湖水库",
      ),
    ];
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SummaryCard(),
              SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true, // 让 ListView 适配 Column
                physics:
                    NeverScrollableScrollPhysics(), // 禁止自己的滚动，交给 SingleChildScrollView
                itemCount: records.length,
                itemBuilder: (context, index) {
                  return FishCard(record: records[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<HomeLogic>();
    super.dispose();
  }
}

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "太湖水库",
                  style: TextStyle(fontSize: 10, color: TColor.primary),
                ),
                Text(
                  "24°C ☀",
                  style: TextStyle(fontSize: 14, color: TColor.primary),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "今日收获",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: TColor.primary,
                      ),
                    ),
                    Text(
                      "3 条",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: TColor.primary,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "总重量",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: TColor.primary,
                      ),
                    ),
                    Text(
                      "3.5 kg",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: TColor.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FishCard extends StatelessWidget {
  final FishRecord record;

  const FishCard({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    return Clickable(
      // onTap: () => Get.snackbar("title", "message"),
      backgroundColor: TColor.bg,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 第一层 时间 地点
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    record.time,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: TColor.primary,
                    ),
                  ),
                  Text(
                    record.address,
                    style: TextStyle(color: Colors.grey, fontSize: 8),
                  ),
                ],
              ),
              // 第二次 图片 鱼类 重量
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //第一部分 图片 鱼类 饵料
                  Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Image.network(
                            record.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: Text(
                              record.type,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Text(
                            "使用饵料:${record.bait}",
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(record.weight, style: TextStyle(color: Colors.blue)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FishRecord {
  final String time;
  final String type;
  final String weight;
  final String bait;
  final String imageUrl;
  final String address;

  FishRecord({
    required this.time,
    required this.type,
    required this.weight,
    required this.bait,
    required this.imageUrl,
    required this.address,
  });
}
