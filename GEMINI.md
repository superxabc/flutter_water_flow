# GEMINI.md

# 项目: flutter_water_flow

本配置用于定义 Flutter 瀑布流组件库 `flutter_water_flow` 的开发流程、自动化行为和 Gemini CLI 的上下文理解。

---

## 📌 项目元信息

* **项目名称**：flutter_water_flow
* **项目类型**：Flutter Package
* **功能定位**：
  * 基于 `flutter_staggered_grid_view` 的高性能瀑布流布局封装
  * 简化API，降低使用门槛
  * 内置广告识别、加载更多等常见功能
  * 类型安全的项目类型枚举
* **适用场景**：商品瀑布流、图文列表、媒体展示、社交动态等高动态 UI 场景

---

## ⚙️ 开发指令约定

* 使用 Flutter 官方格式与分析工具：

  ```bash
  dart format .
  flutter analyze .
  ```

* 常规开发中建议使用：

  ```bash
  flutter pub get
  ```

* 注释要求：
  * 所有公共API需附带清晰的文档注释
  * 对关键业务逻辑需标注实现原理
  * 复杂配置项需提供使用示例

---

## 🛠️ 自动化任务流程

* 提交前自动触发以下检查流程：

  ```bash
  dart format .
  flutter analyze
  ```

* 发布前检查命令：

  ```bash
  dart pub publish --dry-run
  ```

* 支持 Gemini CLI 自动生成以下内容：
  * Widget 使用示例模板
  * 测试文件骨架
  * API 文档更新

---

## 🔐 文件写入与权限配置

* ✅ 允许 Gemini CLI 修改：
  * `lib/` 目录下内容
  * `pubspec.yaml` 中依赖与版本
  * `CHANGELOG.md`、`README.md` 补充说明
  * 文档文件更新

* ❌ 禁止 CLI 执行以下操作（默认关闭）：
  * 删除文件 (`rm`、`deleteSync`)
  * 移动目录结构
  * 修改 `.git/` 内部配置

---

## 🏗️ 项目架构概览

### 核心组件结构
```
flutter_water_flow/
├── lib/
│   ├── flutter_water_flow.dart      # 主入口文件
│   └── src/
│       ├── water_flow_view.dart     # 核心Widget组件
│       └── models/
│           └── water_flow_item.dart # 数据模型
```

### 组件职责分工
* `WaterFlow`：对外暴露的 Widget 入口，提供统一API
* `WaterFlowItemType`：项目类型枚举，支持 normal/ad 类型
* `WaterFlowItem`：数据模型，包含类型、索引、数据等属性

### 🎯 技术特点：
* 基于成熟的 `flutter_staggered_grid_view` 库实现
* 通过封装简化API，降低学习成本
* 内置滚动监听，自动触发加载更多
* 支持项目类型识别，实现差异化渲染
* 类型安全的枚举设计，避免魔法数字

---

## ✍️ 代码风格规范

* **命名风格**：`camelCase`；类名首字母大写
* **常量使用**：`const`；构造方法优先 `const` 构造
* **API设计**：简洁统一，避免过度设计
* **类型安全**：优先使用枚举而非魔法数字
* **文档注释**：所有公共API必须有文档注释

---



---

## 📦 发布规范

* 发布前版本号更新至 `pubspec.yaml` 和 `CHANGELOG.md`
* 发布命令：

  ```bash
  dart pub publish
  ```
* 建议先执行 dry-run：

  ```bash
  dart pub publish --dry-run
  ```
* 示例工程需同步更新版本依赖

---

## 🔄 开发流程规范

### 功能开发流程
1. **需求分析**：明确功能需求和API设计
2. **实现开发**：基于 `flutter_staggered_grid_view` 进行封装
3. **测试验证**：在 `nummate_app` 中进行功能测试
4. **文档更新**：更新相关文档和示例
5. **代码审查**：确保代码质量和一致性

### 版本管理
* 遵循语义化版本控制 (Semantic Versioning)
* 主版本号：不兼容的API修改
* 次版本号：向下兼容的功能性新增
* 修订号：向下兼容的问题修正

### 文档维护
* `README.md`：主要使用文档和API参考
* `CHANGELOG.md`：版本变更记录
* `产品设计文档.md`：产品功能说明
* `技术架构文档.md`：技术实现细节
* `清理总结.md`：项目清理记录

---

## 🎯 技术选型原则

### 当前技术栈
* **底层库**：`flutter_staggered_grid_view` - 社区验证的成熟瀑布流库
* **封装层**：简化API，增强功能，提供业务逻辑支持
* **类型系统**：支持项目类型识别和差异化渲染

### 技术选型优势
1. **稳定性**：基于成熟库，避免重复造轮子
2. **性能**：继承底层库的性能优化
3. **维护性**：社区维护，持续更新
4. **扩展性**：封装层提供扩展空间

---

## 🚀 功能规划与路线图

### 当前功能状态 (v1.0.0)
#### 核心功能 (100% 完成)
- ✅ **多列瀑布流布局**：支持任意列数配置
- ✅ **动态高度适配**：完美支持不同高度item
- ✅ **高性能滚动**：基于成熟库，性能优异
- ✅ **间距配置**：支持主轴和交叉轴间距
- ✅ **内边距设置**：支持整体padding
- ✅ **无限滚动**：内置加载更多机制
- ✅ **广告支持**：支持广告识别和样式区分
- ✅ **用户交互**：支持点击事件处理
- ✅ **类型安全API**：枚举类型，避免魔法数字

### 短期优化计划 (v1.1.0 - 1-2个月)

#### 1. 性能增强 (投入：3-5天)
```dart
// 智能预加载 - 提升用户体验
class SmartPreloader {
  void preloadItems(int currentIndex, int preloadCount) {
    // 根据滚动速度预测需要加载的item
    // 预期提升滚动流畅度 30%
  }
}

// 缓存优化 - 减少重建
class ItemCache {
  Map<int, Widget> _cache = {};
  // 预期减少重建次数 50%
}
```

#### 2. API增强 (投入：2-3天)
```dart
// 头部/尾部支持 - 常见需求
WaterFlow.builder(
  header: () => HeaderWidget(),
  footer: () => FooterWidget(),
  // 满足90%的头尾需求
)

// 下拉刷新支持 - 用户体验
WaterFlow.builder(
  onRefresh: () async => await refreshData(),
  // 标准化下拉刷新实现
)

// 动画配置 - 视觉增强
WaterFlow.builder(
  animationConfig: AnimationConfig(
    enableItemAnimation: true,
    animationDuration: Duration(milliseconds: 300),
  ),
)
```

### 中期优化计划 (v1.2.0 - 3-6个月)

#### 1. 智能布局 (投入：1-2周)
```dart
// 自适应列数 - 响应式设计
WaterFlow.builder(
  adaptiveColumns: AdaptiveColumnConfig(
    minColumnWidth: 150.0,
    maxColumns: 4,
  ),
  // 解决不同屏幕尺寸适配问题
)
```

#### 2. 高级功能 (投入：2-3周)
```dart
// 分组支持 - 复杂业务场景
WaterFlow.builder(
  groupBy: (index) => items[index].category,
  groupHeaderBuilder: (category) => CategoryHeader(category),
  // 支持复杂内容分组展示
)

// 多选模式 - 批量操作
WaterFlow.builder(
  selectionMode: SelectionMode.multiple,
  onSelectionChanged: (selectedIndices) => handleSelection(selectedIndices),
)
```

### 长期优化计划 (v1.3.0+ - 6个月+)

#### 1. AI辅助优化 (投入：1-2个月)
```dart
// 智能布局优化 - 提升转化率
class AILayoutOptimizer {
  Point<int> suggestAdPosition(List<Item> items, AdItem ad) {
    // 基于用户行为数据优化广告位置
    // 预期提升点击率 20-30%
  }
}
```

#### 2. 跨平台增强 (投入：3-4周)
```dart
// Web/桌面优化 - 扩大适用场景  
class PlatformOptimizer {
  void optimizeForPlatform() {
    // Web: 虚拟滚动、SEO优化
    // 桌面: 鼠标交互、键盘导航
  }
}
```

---

## 📊 技术指标

### 代码质量指标
* **编译通过率**：100%
* **代码分析**：无警告和错误
* **测试覆盖率**：核心功能100%覆盖
* **文档完整性**：所有公共API有文档

### 性能指标
* **滚动流畅度**：60FPS
* **内存使用**：合理控制，避免泄漏
* **启动时间**：不影响应用启动

### 开发效率指标
* **API简洁性**：降低75%学习成本
* **集成效率**：提升75%开发效率
* **功能完整性**：满足90%使用场景

---

## 🎯 项目愿景

`flutter_water_flow` 致力于成为 Flutter 生态中最**简洁、高效、易用**的瀑布流解决方案，通过合理的封装和优化，让开发者能够快速构建高质量的瀑布流界面，专注于业务逻辑而非底层实现细节。