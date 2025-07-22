// lib/src/models/info_flow_card_model.dart
import 'package:flutter_water_flow/flutter_water_flow.dart';

class InfoFlowCardModel {
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
