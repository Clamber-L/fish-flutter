import 'package:flutter_fish/common/index.dart';

class FishRecordApi extends BaseApi<FishRecord> {
  FishRecordApi() : super(FishRecord.fromJson, prefix: "/fish_record");

  Future<List<FishRecord>> list() {
    return api.getList("$prefix/list");
  }
}
