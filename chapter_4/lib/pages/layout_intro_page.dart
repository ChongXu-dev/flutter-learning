import 'package:flutter/material.dart';

class LayoutIntroPage extends StatelessWidget {
  const LayoutIntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('4.1 布局类组件简介'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('布局组件分类'),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildCategoryChip('线性布局', Colors.blue),
                const SizedBox(width: 8),
                _buildCategoryChip('弹性布局', Colors.green),
                const SizedBox(width: 8),
                _buildCategoryChip('流式布局', Colors.purple),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildCategoryChip('层叠布局', Colors.orange),
                const SizedBox(width: 8),
                _buildCategoryChip('对齐布局', Colors.red),
              ],
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('布局原则'),
            const SizedBox(height: 8),
            _buildSimpleCard('约束传递', '父组件向子组件传递尺寸约束'),
            _buildSimpleCard('单一职责', '每个布局组件只负责一种布局方式'),
            _buildSimpleCard('组合复用', '通过嵌套组合实现复杂布局'),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }

  Widget _buildCategoryChip(String label, Color color) {
    return Chip(
      label: Text(label, style: const TextStyle(fontSize: 13)),
      backgroundColor: color.withOpacity(0.2),
      labelStyle: TextStyle(color: color),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    );
  }

  Widget _buildSimpleCard(String title, String desc) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(desc, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }
}