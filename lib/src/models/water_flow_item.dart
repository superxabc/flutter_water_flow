import 'water_flow_base_item.dart';

enum WaterFlowItemType {
  normal,
  ad,
}

class WaterFlowItem implements WaterFlowBaseItem {
  @override
  final WaterFlowItemType type;
  final int index;
  final dynamic data;

  const WaterFlowItem({
    required this.type,
    required this.index,
    this.data,
  });

  bool get isAd => type == WaterFlowItemType.ad;
  bool get isNormal => type == WaterFlowItemType.normal;
}
