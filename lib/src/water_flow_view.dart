import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'models/water_flow_base_item.dart';
import 'models/water_flow_item.dart';

class WaterFlow<T extends WaterFlowBaseItem> extends StatelessWidget {
  const WaterFlow.builder({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.columnCount = 2,
    this.spacing = 4.0,
    this.crossAxisSpacing = 4.0,
    this.padding = const EdgeInsets.all(4.0),
    this.getItemType,
    this.onLoadMore,
    this.loadMoreThreshold = 100.0,
    this.onRefresh,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.backgroundColor = const Color(0xFFF2F2F7),
  });

  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final int columnCount;
  final double spacing;
  final double crossAxisSpacing;
  final EdgeInsets? padding;
  final WaterFlowItemType Function(int index)? getItemType;
  final VoidCallback? onLoadMore;
  final double loadMoreThreshold;
  final Future<void> Function()? onRefresh;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final Color? backgroundColor;

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
            notification.metrics.extentAfter < loadMoreThreshold) {
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
      color: backgroundColor,
      child: scrollableView,
    );
  }
}
