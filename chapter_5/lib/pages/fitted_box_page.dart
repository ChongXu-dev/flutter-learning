import 'package:flutter/material.dart';

class FittedBoxPage extends StatelessWidget {
  const FittedBoxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('5.6 空间适配（FittedBox）'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('BoxFit.contain'),
            const SizedBox(height: 8),
            _buildCard(
              title: '保持比例，完整显示',
              child: Container(
                width: 150,
                height: 60,
                color: Colors.blue[100],
                child: const FittedBox(
                  fit: BoxFit.contain,
                  child: Text('Contain'),
                ),
              ),
            ),
            _buildSectionTitle('BoxFit.cover'),
            const SizedBox(height: 8),
            _buildCard(
              title: '填满容器',
              child: Container(
                width: 150,
                height: 60,
                color: Colors.green[100],
                child: const FittedBox(
                  fit: BoxFit.cover,
                  child: Text('Cover'),
                ),
              ),
            ),
            _buildSectionTitle('BoxFit.fill'),
            const SizedBox(height: 8),
            _buildCard(
              title: '拉伸填充',
              child: Container(
                width: 150,
                height: 60,
                color: Colors.orange[100],
                child: const FittedBox(
                  fit: BoxFit.fill,
                  child: Text('Fill'),
                ),
              ),
            ),
            _buildSectionTitle('BoxFit.fitWidth'),
            const SizedBox(height: 8),
            _buildCard(
              title: '按宽度缩放',
              child: Container(
                width: 150,
                height: 60,
                color: Colors.purple[100],
                child: const FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text('FitWidth'),
                ),
              ),
            ),
            _buildSectionTitle('BoxFit.fitHeight'),
            const SizedBox(height: 8),
            _buildCard(
              title: '按高度缩放',
              child: Container(
                width: 150,
                height: 60,
                color: Colors.red[100],
                child: const FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text('FitHeight'),
                ),
              ),
            ),
            _buildSectionTitle('BoxFit.none'),
            const SizedBox(height: 8),
            _buildCard(
              title: '不缩放',
              child: Container(
                width: 80,
                height: 40,
                color: Colors.teal[100],
                child: const FittedBox(
                  fit: BoxFit.none,
                  child: Text('None'),
                ),
              ),
            ),
            _buildSectionTitle('BoxFit.scaleDown'),
            const SizedBox(height: 8),
            _buildCard(
              title: '仅缩小',
              child: Container(
                width: 150,
                height: 60,
                color: Colors.pink[100],
                child: const FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text('ScaleDown'),
                ),
              ),
            ),
            _buildSectionTitle('对齐方式'),
            const SizedBox(height: 8),
            _buildCard(
              title: '顶部对齐',
              child: Container(
                width: 150,
                height: 60,
                color: Colors.blue[100],
                child: const FittedBox(
                  fit: BoxFit.contain,
                  alignment: Alignment.topCenter,
                  child: Text('顶部'),
                ),
              ),
            ),
            _buildCard(
              title: '底部右对齐',
              child: Container(
                width: 150,
                height: 60,
                color: Colors.green[100],
                child: const FittedBox(
                  fit: BoxFit.contain,
                  alignment: Alignment.bottomRight,
                  child: Text('右下'),
                ),
              ),
            ),
            _buildSectionTitle('文字适配'),
            const SizedBox(height: 8),
            _buildCard(
              title: '自适应文字',
              child: Container(
                width: 120,
                height: 50,
                color: Colors.orange[200],
                child: const FittedBox(
                  child: Text('较长文字需要适配'),
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

  Widget _buildCard({required String title, required Widget child}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 6),
            Center(child: child),
          ],
        ),
      ),
    );
  }
}