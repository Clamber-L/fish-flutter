import 'package:flutter_fish/common/models/fish_record.dart';
import 'package:flutter_fish/common/utils/result/status_result.dart';
import 'package:flutter_fish/common/values/constants.dart';
import 'package:flutter_fish/common/widgets/status_view.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RecordState {
  List<FishRecord>? fishRecord = [
    FishRecord(
      time: BoneMock.time,
      type: BoneMock.name,
      weight: "1",
      bait: "1",
      imageUrl: Constants.skeletonImg,
      address: BoneMock.name,
    ),
    FishRecord(
      time: BoneMock.time,
      type: BoneMock.name,
      weight: "1",
      bait: "1",
      imageUrl: Constants.skeletonImg,
      address: BoneMock.name,
    ),
    FishRecord(
      time: BoneMock.time,
      type: BoneMock.name,
      weight: "1",
      bait: "1",
      imageUrl: Constants.skeletonImg,
      address: BoneMock.name,
    ),
  ];
  int page = 1;

  late StatusPager<FishRecord> result;

  bool isNoMore = true;

  bool isLoading = true;

  Status status = Status.LOADING; // 初始状态为加载中
  String errorMessage = ''; // 错误信息

  final RxInt currentPageIndex = 0.obs;
}
