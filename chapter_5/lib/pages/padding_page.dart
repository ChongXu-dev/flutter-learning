import 'package:flutter/material.dart';

class PaddingPage extends StatelessWidget {
  const PaddingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('5.1 填充（Padding）'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Padding基础用法'),
            const SizedBox(height: 8),
            _buildCard(
              title: '对称内边距',
              child: Container(
                color: Colors.blue[100],
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('所有方向都有16像素内边距'),
                ),
              ),
            ),
            _buildCard(
              title: '水平方向内边距',
              child: Container(
                color: Colors.green[100],
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text('左右各24像素内边距'),
                ),
              ),
            ),
            _buildCard(
              title: '垂直方向内边距',
              child: Container(
                color: Colors.yellow[100],
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text('上下各12像素内边距'),
                ),
              ),
            ),
            _buildCard(
              title: '不对称内边距',
              child: Container(
                color: Colors.orange[100],
                child: const Padding(
                  padding: EdgeInsets.only(
                    left: 8,
                    top: 16,
                    right: 24,
                    bottom: 4,
                  ),
                  child: Text('四个方向不同的内边距'),
                ),
              ),
            ),
            _buildSectionTitle('Padding嵌套使用'),
            const SizedBox(height: 8),
            _buildCard(
              title: '多层嵌套',
              child: Container(
                color: Colors.purple[100],
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Text('三层Padding嵌套'),
                    ),
                  ),
                ),
              ),
            ),
            _buildSectionTitle('实际应用场景'),
            const SizedBox(height: 8),
            _buildCard(
              title: '按钮内边距',
              child: ElevatedButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  child: Text('自定义内边距按钮'),
                ),
              ),
            ),
            _buildCard(
              title: '卡片内容内边距',
              child: Card(
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '卡片标题',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('这是卡片内容，使用Padding控制内边距'),
                    ],
                  ),
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
        fontSize: 20,
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
            child,
          ],
        ),
      ),
    );
  }
}