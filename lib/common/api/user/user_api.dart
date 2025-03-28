import 'package:flutter_fish/common/api/base_api.dart';
import 'package:flutter_fish/common/models/user.dart';

class UserApi extends BaseApi<User> {
  UserApi() : super(User.fromJson, prefix: "/flutter");

  // Future<User> getOne() {
  //   return api.get("$prefix/one");
  // }

  // Future<List<User>> getAllUsers() {
  //   return api.getList("$prefix/all");
  // }
}
