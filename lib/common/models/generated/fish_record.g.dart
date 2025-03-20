// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../fish_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FishRecord _$FishRecordFromJson(Map<String, dynamic> json) => FishRecord(
  time: json['harvestTime'] as String,
  type: json['fishType'] as String,
  weight: json['weight'] as String,
  bait: json['bait'] as String,
  imageUrl: json['imageUrl'] as String,
  address: json['address'] as String,
);

Map<String, dynamic> _$FishRecordToJson(FishRecord instance) =>
    <String, dynamic>{
      'harvestTime': instance.time,
      'fishType': instance.type,
      'weight': instance.weight,
      'bait': instance.bait,
      'imageUrl': instance.imageUrl,
      'address': instance.address,
    };
