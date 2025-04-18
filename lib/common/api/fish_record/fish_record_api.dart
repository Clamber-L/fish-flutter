import 'package:flutter_fish/common/index.dart';
import 'package:flutter_fish/common/utils/result/status_result.dart';

class FishRecordApi extends BaseApi<FishRecord> {
  FishRecordApi() : super(FishRecord.fromJson, prefix: "/fish_record");

  Future<StatusResult<List<FishRecord>>> list() {
    return api.getList("$prefix/list");
  }

  Future<StatusPager<FishRecord>> listPage({required int page, int? size}) {
    return super.selectPageList(
      uri: "$prefix/list_page",
      page: page,
      size: size,
    );
  }
}
