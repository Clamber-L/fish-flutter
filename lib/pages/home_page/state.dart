import 'package:flutter_fish/common/index.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeState {
  List<FishRecord>? fishRecord = [
    FishRecord(time: BoneMock.time, type: BoneMock.name, weight: BoneMock.name, bait: BoneMock.name, imageUrl: Constants.skeletonImg, address: BoneMock.name),
    FishRecord(time: BoneMock.time, type: BoneMock.name, weight: BoneMock.name, bait: BoneMock.name, imageUrl: Constants.skeletonImg, address: BoneMock.name),
    FishRecord(time: BoneMock.time, type: BoneMock.name, weight: BoneMock.name, bait: BoneMock.name, imageUrl: Constants.skeletonImg, address: BoneMock.name),
  ];
  bool isLoading = true;
}
