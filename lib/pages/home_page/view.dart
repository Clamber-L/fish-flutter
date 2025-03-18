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
            "https://cdn.pixabay.com/photo/2017/05/31/00/24/aquarium-2358739_1280.jpg",
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
            "https://cdn.pixabay.com/photo/2017/05/31/00/24/aquarium-2358739_1280.jpg",
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
    // 在 HomePage build 方法中修改外层布局
    return SafeArea(
      child: Container(
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12), // 增加水平间距
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(), // 更自然的滚动效果
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 8),
                SummaryCard(),
                const SizedBox(height: 20), // 增加卡片间距
                // ListView.builder(
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   itemCount: records.length,
                //   itemBuilder: (context, index) {
                //     return Padding(
                //       padding: const EdgeInsets.only(bottom: 10), // 列表项间距
                //       child: FishCard(record: records[index]),
                //     );
                //   },
                // ),
              ],
            ),
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
      elevation: 1, // 增加阴影深度
      color: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text("今日天气", style: TextStyle(fontSize: 20))],
        ),
      ),
    );
  }

  Widget _buildStatItem(String title, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: TColor.primary,
            letterSpacing: 0.8,
          ),
        ),
      ],
    );
  }
}

class FishCard extends StatelessWidget {
  final FishRecord record;

  const FishCard({super.key, required this.record});

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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
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
                    fontSize: 11,
                    color: Colors.grey[700],
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 12,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      record.address,
                      style: TextStyle(color: Colors.grey[600], fontSize: 9),
                    ),
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
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
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
                          fontSize: 18, // 减小字号
                          fontWeight: FontWeight.w700,
                          color: TColor.primary.withAlpha(240),
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        height: 2,
                        width: 24,
                        color: TColor.primary.withAlpha(51),
                        margin: const EdgeInsets.only(bottom: 4),
                      ),
                      _buildInfoRow(
                        Icons.eco_rounded,
                        "饵料",
                        record.bait,
                        Colors.grey[600]!,
                      ),
                      const SizedBox(height: 8),
                      _buildInfoRow(
                        Icons.balance_outlined,
                        "重量",
                        record.weight,
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
              TextSpan(
                text: "$label\n",
                style: TextStyle(
                  fontSize: 10,
                  color: color.withAlpha(150),
                  height: 1.4,
                ),
              ),
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
