import 'package:flutter_fish/common/utils/result/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/fish_record.g.dart';

@JsonSerializable()
class FishRecord extends Model<FishRecord> {
  @JsonKey(name: "harvestTime")
  String time;
  @JsonKey(name: "fishType")
  String type;
  @JsonKey(name: "weight")
  String weight;
  @JsonKey(name: "bait")
  String bait;
  @JsonKey(name: "imageUrl")
  String imageUrl;
  @JsonKey(name: "address")
  String address;

  FishRecord({required this.time, required this.type, required this.weight, required this.bait, required this.imageUrl, required this.address});

  factory FishRecord.fromJson(Map<String, dynamic> json) => _$FishRecordFromJson(json);

  Map<String, dynamic> toJson() => _$FishRecordToJson(this);
}
