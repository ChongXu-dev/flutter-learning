import 'package:flutter/material.dart';

class AlignLayoutPage extends StatelessWidget {
  const AlignLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('4.7 对齐与相对定位'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Align 对齐'),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _buildAlignCard('topLeft', Alignment.topLeft),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildAlignCard('topCenter', Alignment.topCenter),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _buildAlignCard('center', Alignment.center),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildAlignCard('bottomRight', Alignment.bottomRight),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildSectionTitle('自定义偏移'),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _buildAlignCard('(-0.5, -0.5)', const Alignment(-0.5, -0.5)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildAlignCard('(0.5, 0.5)', const Alignment(0.5, 0.5)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildSectionTitle('Center 组件'),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  height: 80,
                  color: Colors.grey[200],
                  child: const Center(child: Text('Center居中')),
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

  Widget _buildAlignCard(String title, Alignment alignment) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              height: 60,
              color: Colors.grey[200],
              child: Align(
                alignment: alignment,
                child: Container(width: 30, height: 20, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}