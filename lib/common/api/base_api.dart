import 'package:flutter_fish/common/net/http_api.dart';
import 'package:flutter_fish/common/utils/result/model.dart';
import 'package:flutter_fish/common/utils/result/pager.dart';
import 'package:flutter_fish/common/utils/result/status_result.dart';
import 'package:flutter_fish/common/widgets/status_view.dart';

class BaseApi<M extends Model<M>> {
  final HttpApi<M> api;
  final Converter<M> converter;
  late final String prefix; // 功能模块前缀

  BaseApi(this.converter, {String? prefix}) : api = HttpApi(converter) {
    this.prefix = prefix ?? "/${M.toString().toLowerCase()}";
  }

  // /// 通过主键 ID 查询数据详情
  // Future<M> selectById(String id) => api.get("$prefix/$id");

  // /// 查询某模块的数据列表
  // Future<(List<M>, Status)> selectList() => api.getList("$prefix/all");

  /// 查询某模块的分页列表数据
  Future<StatusPager<M>> selectPageList({
    required String uri,
    required int page,
    int? size,
    Map<String, dynamic>? query,
  }) {
    query = query ?? <String, dynamic>{};
    query["pageNum"] = page;
    query["pageSize"] = size ?? 5;
    return api.getPageList(uri, query: query);
  }

  /// 创建模型
  Future<bool> create(M model) => api.post(prefix, data: model);

  /// 修改模型
  Future<bool> updateById(M model) =>
      api.post("$prefix/${model.id}", data: model);

  /// 通过 ID 删除指定的模型数据
  Future<bool> deleteById(String id) => api.post("$prefix/$id");
}
