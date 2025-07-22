import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'models/water_flow_item.dart';

class WaterFlow extends StatelessWidget {
  const WaterFlow.builder({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.columnCount = 2,
    this.spacing = 0.5,
    this.crossAxisSpacing = 0.5,
    this.padding = const EdgeInsets.only(left: 1.0, right: 1.0),
    this.getItemType,
    this.onLoadMore,
    this.onRefresh,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
  });

  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final int columnCount;
  final double spacing;
  final double crossAxisSpacing;
  final EdgeInsets? padding;
  final WaterFlowItemType Function(int index)? getItemType;
  final VoidCallback? onLoadMore;
  final Future<void> Function()? onRefresh;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;

  @override
  Widget build(BuildContext context) {
    final gridView = MasonryGridView.builder(
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columnCount,
      ),
      mainAxisSpacing: spacing,
      crossAxisSpacing: crossAxisSpacing,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes,
    );

    final paddedGridView = Padding(
      padding: padding ?? EdgeInsets.zero,
      child: gridView,
    );

    final scrollableView = NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (onLoadMore != null &&
            notification is ScrollEndNotification &&
            notification.metrics.extentAfter < 100) {
          Future.microtask(onLoadMore!);
        }
        return false;
      },
      child: paddedGridView,
    );

    if (onRefresh != null) {
      return RefreshIndicator(
        onRefresh: onRefresh!,
        child: scrollableView,
      );
    }

    return Container(
      color: const Color(0xFFF2F2F7), // iOS风格浅灰色背景
      child: scrollableView,
    );
  }
}
