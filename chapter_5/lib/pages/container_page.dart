import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  const ContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('5.4 Container容器'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Container基础'),
            const SizedBox(height: 8),
            _buildCard(
              title: '固定尺寸',
              child: Container(
                width: 150,
                height: 60,
                color: Colors.blue[200],
                child: const Center(child: Text('固定尺寸', style: TextStyle(fontSize: 12))),
              ),
            ),
            _buildCard(
              title: '自适应尺寸',
              child: Container(
                color: Colors.green[200],
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('自适应内容', style: TextStyle(fontSize: 12)),
                ),
              ),
            ),
            _buildSectionTitle('容器装饰'),
            const SizedBox(height: 8),
            _buildCard(
              title: '圆角容器',
              child: Container(
                width: 150,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.orange[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(child: Text('圆角', style: TextStyle(fontSize: 12))),
              ),
            ),
            _buildCard(
              title: '带边框',
              child: Container(
                width: 150,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(child: Text('带边框', style: TextStyle(fontSize: 12))),
              ),
            ),
            _buildCard(
              title: '渐变背景',
              child: Container(
                width: 150,
                height: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.purple],
                  ),
                ),
                child: const Center(
                  child: Text('渐变', style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
            ),
            _buildCard(
              title: '带阴影',
              child: Container(
                width: 150,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: const Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: const Center(child: Text('阴影', style: TextStyle(fontSize: 12))),
              ),
            ),
            _buildSectionTitle('内边距和外边距'),
            const SizedBox(height: 8),
            _buildCard(
              title: '内边距',
              child: Container(
                width: 150,
                height: 80,
                color: Colors.blue[100],
                padding: const EdgeInsets.all(12),
                child: Container(
                  color: Colors.blue[300],
                  child: const Center(child: Text('padding', style: TextStyle(fontSize: 12))),
                ),
              ),
            ),
            _buildCard(
              title: '外边距',
              child: Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(4),
                child: Container(
                  width: 120,
                  height: 40,
                  color: Colors.green[300],
                  margin: const EdgeInsets.all(10),
                  child: const Center(child: Text('margin', style: TextStyle(fontSize: 12))),
                ),
              ),
            ),
            _buildSectionTitle('容器变换'),
            const SizedBox(height: 8),
            _buildCard(
              title: '倾斜变换',
              child: Container(
                width: 120,
                height: 45,
                color: Colors.purple[300],
                transform: Matrix4.skewX(0.2),
                child: const Center(child: Text('倾斜', style: TextStyle(fontSize: 12))),
              ),
            ),
            _buildCard(
              title: '综合示例',
              child: Container(
                width: 150,
                height: 70,
                margin: const EdgeInsets.all(6),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      offset: const Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: const Center(
                  child: Text('综合', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
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