import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fish/common/utils/result/model.dart';
import 'package:flutter_fish/common/utils/result/status_result.dart';

/// 刷新列表中用于构造列表的每一项的构造器
/// * @param [M] 列表数据的泛型类型
/// * @return [Widget] 列表构造器返回的渲染视图
typedef ItemBuilder<M extends Model<M>> =
    Widget Function(BuildContext context, int index, M model);

class RefreshList<M extends Model<M>> extends StatefulWidget {
  final StatusPager<M> items;
  final ItemBuilder<M> builder;
  final bool noMore;

  const RefreshList({
    super.key,
    required this.builder,
    required this.items,
    required this.noMore,
  });

  @override
  State<RefreshList> createState() => _RefreshListState<M>();
}

class _RefreshListState<M extends Model<M>> extends State<RefreshList<M>> {
  late final EasyRefreshController _controller;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void refresh() => _controller.callRefresh();

  @override
  Widget build(BuildContext context) {
    // 下拉刷新 & 上拉加载更多会走这里。
    return _refreshWidget(context);
    // 仅首次加载时需要显示加载动画以及网络状态监听，后续则不需要。
    // return DataLoader(
    //   future: () => widget.future(1),
    //   builder: (pager) {
    //     _pager = pager;
    //     _items = pager.items;
    //     return _refreshWidget(context);
    //   },
    // );

    // Widget listView = ListView.builder(
    //   shrinkWrap: true,
    //   itemCount: 5,
    //   itemBuilder: (context, index) {
    //     return FishCard(record: state.fishRecord![index]);
    //   },
    // );
    // return SkeletonStatus(
    //   listView: listView,
    //   stateStatus: state.status,
    //   width: MediaQuery.of(context).size.width,
    //   height: 150.h,
    //   retry: () => logic.initRecordList(),
    // );

    return _refreshWidget(context);
  }

  Widget _refreshWidget(BuildContext context) {
    // final iconTheme = context.theme.data.iconTheme.copyWith(
    //   color: context.theme.themeColor,
    // );
    return EasyRefresh(
      refreshOnStart: false,
      resetAfterRefresh: true,
      controller: _controller,
      onRefresh: _onRefresh,
      onLoad: _onLoadMore,
      header: ClassicHeader(
        spacing: 5,
        showText: true,
        triggerOffset: kToolbarHeight,
        showMessage: false,
        dragText: '下拉以刷新',
        armedText: '释放开始刷新',
        readyText: '刷新中',
        processingText: '刷新中',
        processedText: '刷新成功',
        noMoreText: '没有更多数据',
        failedText: '加载失败',
        // iconTheme: iconTheme,
        progressIndicatorSize: 14,
        textStyle: TextStyle(fontSize: 12),
      ),
      footer: ClassicFooter(
        spacing: 5,
        showText: widget.noMore,
        showMessage: false,
        noMoreText: '-- 我是有底线的，没有更多了 --',
        // iconTheme:
        //     isNoMore
        //         ? iconTheme.copyWith(color: Colors.transparent)
        //         : iconTheme,
        iconDimension: widget.noMore ? 0 : 24,
        progressIndicatorSize: 14,
        triggerOffset: 40,
        textStyle: const TextStyle(fontSize: 12, color: Colors.black38),
      ),

      child: ListView.builder(
        itemCount: widget.items.data.items?.length ?? 0,
        cacheExtent: (widget.items.data.pageSize).toDouble(),
        addRepaintBoundaries: false,
        itemBuilder: (context, index) {
          return widget.builder.call(
            context,
            index,
            widget.items.data.items![index],
          );
        },
      ),
    );
  }

  void _onRefresh() {
    // widget
    //     .future(1)
    //     .then((pager) {
    //       setState(() {
    //         _pager = pager;
    //         _items = pager.items;
    //         _controller.finishRefresh();
    //         _controller.resetFooter();
    //       });
    //     })
    //     .catchError((error) {
    //       setState(() {
    //         _controller.finishRefresh(IndicatorResult.fail);
    //       });
    //     });
  }

  void _onLoadMore() {
    // widget
    //     .future((_pager?.page ?? 1) + 1)
    //     .then((pager) {
    //       setState(() {
    //         _pager = pager;
    //         if (Helper.isNotEmpty(pager.items)) {
    //           _items!.addAll(pager.items!);
    //         }
    //         _controller.finishLoad(
    //           isNoMore ? IndicatorResult.noMore : IndicatorResult.success,
    //         );
    //       });
    //     })
    //     .catchError((error) {
    //       setState(() {
    //         _controller.finishLoad(IndicatorResult.fail);
    //       });
    //     });
  }
}
