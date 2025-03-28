import 'package:dio/dio.dart';
import 'package:flutter_fish/common/net/http.dart';
import 'package:flutter_fish/common/utils/result/model.dart';
import 'package:flutter_fish/common/utils/result/pager.dart';
import 'package:flutter_fish/common/utils/result/result.dart';
import 'package:flutter_fish/common/utils/result/status_result.dart';
import 'package:flutter_fish/common/widgets/status_view.dart';

class HttpApi<M extends Model<M>> {
  final Converter<M> converter;
  const HttpApi(this.converter);

  Future<StatusResult<M>> get(
    String path, {
    Duration? delay,
    Map<String, dynamic>? query,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return Http.get<Result>(
      path,
      query: query,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    ).then(
      (res) => StatusResult(
        status: res.success ? Status.LOADED : Status.FAILED,
        data: res.toModel(converter),
      ),
    );
  }

  Future<StatusResult<List<M>>> getList(
    String path, {
    Duration? delay,
    Map<String, dynamic>? query,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return Http.get<Result>(
      path,
      query: query,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    ).then(
      (res) => StatusResult(
        status:
            res.success
                ? Status.LOADED
                : StatusResult.convertToStatus(res.code),
        data: res.toArray(converter),
      ),
    );
  }

  Future<StatusPagerResult<M>> getPageList(
    String path, {
    Duration? delay,
    Map<String, dynamic>? query,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return Http.get<Result>(
      path,
      query: query,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    ).then(
      (res) => StatusPagerResult(
        status:
            res.success
                ? Status.LOADED
                : StatusResult.convertToStatus(res.code),
        data: res.toModel((data) => Pager<M>.fromJson(data, converter)),
      ),
    );
  }

  Future<bool> post(
    String path, {
    Object? data,
    Duration? delay,
    Map<String, dynamic>? query,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return Http.post<Result>(
      path,
      data: _dataExpand(data),
      query: query,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    ).then((res) => res.success);
  }

  static Object? _dataExpand(Object? data) {
    return data == null ? null : (data is Model ? data.toJson() : data);
  }
}
