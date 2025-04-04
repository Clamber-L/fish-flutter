import 'package:flutter_fish/common/utils/converter/datetime_converter.dart';
import 'package:flutter_fish/common/utils/result/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/user.g.dart';

@JsonSerializable(converters: [DatetimeConverterTimestamp()])
class User extends Model<User> {
  @override
  final String id;
  final String username;
  final String? nickname;
  final DateTime? createAt;

  const User({
    required this.id,
    required this.username,
    this.nickname,
    this.createAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
