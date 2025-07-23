# Changelog

## [1.1.0] - 2024-07-23

### ✨ 新增功能
- `WaterFlow` 组件新增 `loadMoreThreshold` 参数，支持自定义加载更多触发距离。
- `WaterFlow` 组件新增 `backgroundColor` 参数，支持自定义背景颜色。
- `WaterFlow` 组件支持泛型 `T extends WaterFlowBaseItem`，提升类型安全性与扩展性。

### 🏗️ 架构优化
- 调整 `WaterFlow` 组件默认间距：`spacing` 和 `crossAxisSpacing` 默认值调整为 `2.0`，`padding` 默认值调整为 `EdgeInsets.all(2.0)`。
- 引入 `WaterFlowBaseItem` 抽象类，作为所有信息流 Item 数据模型的基类，方便后续扩展图文、视频、文本等卡片类型。
- `WaterFlowItem` 和 `InfoFlowCardModel` 已继承 `WaterFlowBaseItem`。
- `InfoFlowCard` 组件的 `Image.network` 添加 `loadingBuilder` 和 `errorBuilder`，优化图片加载体验。

### 📚 文档更新
- 更新 `README.md` 中 `WaterFlow.builder` 参数说明及示例代码，反映新的默认间距和新增参数。
- `README.md` 新增关于如何扩展新卡片类型的部分，强调 Item Widget 根组件 `margin: EdgeInsets.zero` 的原则。

## [1.0.0] - 2024-12-19

### ✨ 新增功能
- 实现了完整的瀑布流布局组件
- 支持多列动态瀑布流布局（默认2列，可自定义）
- 支持动态高度子项，无固定高度限制
- 支持广告内容插入，位于列中，样式可区分
- 支持无限滚动加载
- 支持下拉刷新
- 提供简洁的 builder 模式 API

### 🏗️ 架构实现
- 基于成熟的 `flutter_staggered_grid_view` 库实现
- 通过封装简化API，降低使用门槛
- 内置加载更多、类型识别等常见功能
- 提供类型安全的项目类型枚举

### 📦 组件结构
- **Widget 层**：`WaterFlow` - 对外暴露的入口组件
- **数据层**：`WaterFlowItem` - 项目类型和数据模型
- **底层实现**：`flutter_staggered_grid_view` - 高性能瀑布流渲染

### 📚 文档完善
- 更新了产品设计文档，反映新实现架构
- 更新了技术架构文档，突出封装优势
- 完善了 README 文档，包含完整的使用说明和 API 文档
- 提供了基本使用和高级用法的代码示例

### 🎯 示例应用
- 在 `nummate_app` 中实现了完整的 demo
- 包含基础瀑布流展示、广告内容插入
- 实现了无限滚动加载和用户交互
- 提供了点击效果和视觉反馈

### 🔧 技术特性
- 高性能：基于成熟库，滚动流畅，性能优异
- 易使用：统一API，降低学习成本，快速集成
- 类型安全：枚举类型，避免魔法数字
- 稳定可靠：基于社区验证的成熟方案
