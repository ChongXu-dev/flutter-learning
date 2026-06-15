import 'package:flutter/material.dart';

class LayoutConstraintsPage extends StatelessWidget {
  const LayoutConstraintsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('4.2 布局原理与约束'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('BoxConstraints'),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _buildConstraintCard(
                    '最大宽度',
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 150),
                      child: Container(height: 40, color: Colors.blue[200]),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildConstraintCard(
                    '最小高度',
                    ConstrainedBox(
                      constraints: const BoxConstraints(minHeight: 60),
                      child: Container(height: 30, color: Colors.green[200]),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildConstraintCard(
                    '固定大小',
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 80, maxWidth: 80,
                        minHeight: 40, maxHeight: 40,
                      ),
                      child: Container(color: Colors.orange[200]),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildConstraintCard(
                    '无约束',
                    UnconstrainedBox(
                      child: Container(width: 60, height: 40, color: Colors.purple[200]),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('布局流程'),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: const [
                    StepItem(1, '父组件传递约束'),
                    StepItem(2, '子组件确定大小'),
                    StepItem(3, '子组件告知位置'),
                  ],
                ),
              ),
            ),
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

  Widget _buildConstraintCard(String title, Widget child) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Center(child: child),
          ],
        ),
      ),
    );
  }
}

class StepItem extends StatelessWidget {
  final int step;
  final String text;
  const StepItem(this.step, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: Colors.blue,
          child: Text('$step', style: const TextStyle(color: Colors.white, fontSize: 12)),
        ),
        const SizedBox(width: 12),
        Text(text, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}