import 'package:flutter/material.dart';
import 'package:flutter_fish/common/widgets/status_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonStatus extends StatelessWidget {
  final Widget listView;
  final Status stateStatus;
  final double width;
  final double height;
  final VoidCallback retry;

  const SkeletonStatus({
    super.key,
    required this.listView,
    required this.stateStatus,
    required this.width,
    required this.height,
    required this.retry,
  });

  @override
  Widget build(BuildContext context) {
    return stateStatus == Status.LOADING
        ? Skeletonizer(enabled: true, child: listView)
        : stateStatus == Status.LOADED
        ? listView
        : SizedBox(
          width: width,
          height: height,
          child: StatusView(
            // 错误状态展示组件
            retry: retry,
            status: stateStatus,
          ),
        );
  }
}
