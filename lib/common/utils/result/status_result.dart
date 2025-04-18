import 'package:flutter_fish/common/utils/result/model.dart';
import 'package:flutter_fish/common/utils/result/pager.dart';
import 'package:flutter_fish/common/widgets/status_view.dart';

// 通用状态结果封装
class StatusResult<T> {
  final Status status;
  final T data;

  const StatusResult({required this.status, required this.data});

  static Status convertToStatus(int code) {
    switch (code) {
      case 200:
        return Status.LOADED;
      case 0:
        return Status.FAILED;
      case 500:
        return Status.NETWORK_ERROR;
      default:
        return Status.FAILED;
    }
  }
}

// 分页结果特殊封装
class StatusPager<T extends Model<T>> {
  final Status status;
  final Pager<T> data;
  const StatusPager({required this.status, required this.data});
}
