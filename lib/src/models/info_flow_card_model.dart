// lib/src/models/info_flow_card_model.dart
import 'water_flow_base_item.dart';
import 'water_flow_item.dart';

class InfoFlowCardModel implements WaterFlowBaseItem {
  @override
  final WaterFlowItemType type;
  final String imageUrl;
  final double aspectRatio;
  final String title;
  final String? author;
  final String? avatarUrl;
  final int? likes;
  final bool isLiked;
  final List<String> tags;

  const InfoFlowCardModel({
    required this.type,
    required this.imageUrl,
    required this.aspectRatio,
    required this.title,
    this.author,
    this.avatarUrl,
    this.likes,
    this.isLiked = false,
    this.tags = const [],
  });
}
