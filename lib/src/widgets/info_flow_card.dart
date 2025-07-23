import 'package:flutter/material.dart';
import 'package:flutter_water_flow/flutter_water_flow.dart';

class InfoFlowCard extends StatelessWidget {
  final InfoFlowCardModel data;
  final VoidCallback? onImageTap;
  final VoidCallback? onAuthorTap;
  final VoidCallback? onLikeTap;
  final VoidCallback? onLongPress;

  const InfoFlowCard({
    super.key,
    required this.data,
    this.onImageTap,
    this.onAuthorTap,
    this.onLikeTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => _showCardPopupMenu(context),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Colors.white
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 图片区域
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onImageTap,
              child: AspectRatio(
                aspectRatio: data.aspectRatio,
                child: Image.network(
                  data.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return InfoFlowCardSkeleton(aspectRatio: data.aspectRatio);
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: const Center(
                        child: Icon(
                          Icons.broken_image,
                          color: Colors.grey,
                          size: 40,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // 内容区域
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 标题
                  Text(
                    data.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 4),

                  // 标签
                  if (data.tags.isNotEmpty)
                    Wrap(
                      spacing: 4.0,
                      runSpacing: 4.0,
                      children: data.tags
                          .map((tag) => Chip(
                                label: Text(tag),
                                labelStyle: const TextStyle(fontSize: 10),
                                padding: EdgeInsets.zero,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              ))
                          .toList(),
                    ),

                  const SizedBox(height: 4),

                  // 作者和点赞
                  if (data.type == WaterFlowItemType.normal)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Row(
                        children: [
                          // 作者头像和名字
                          if (data.avatarUrl != null)
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: onAuthorTap,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 9, // 头像尺寸调整为和点赞图标一致
                                    backgroundImage:
                                        NetworkImage(data.avatarUrl!),
                                  ),
                                  const SizedBox(width: 2),
                                  if (data.author != null)
                                    Text(
                                      data.author!,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                ],
                              ),
                            ),

                          const Spacer(),

                          // 点赞按钮和数量
                          if (data.likes != null)
                            Row(
                              children: [
                                GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: onLikeTap,
                                  child: Icon(
                                    data.isLiked
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color:
                                        data.isLiked ? Colors.red : Colors.grey,
                                    size: 18,
                                  ),
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  data.likes.toString(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCardPopupMenu(BuildContext context) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    final Offset position = box.localToGlobal(Offset.zero);
    final RelativeRect rect = RelativeRect.fromLTRB(
      position.dx,
      position.dy,
      position.dx + box.size.width,
      position.dy + box.size.height,
    );

    showMenu(
      context: context,
      position: rect,
      items: const [
        PopupMenuItem(child: Text('收藏')),
        PopupMenuItem(child: Text('举报')),
        PopupMenuItem(child: Text('不感兴趣')),
      ],
    );
  }
}
