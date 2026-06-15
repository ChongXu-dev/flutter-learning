import 'package:flutter/material.dart';

class DecoratedBoxPage extends StatelessWidget {
  const DecoratedBoxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('5.2 装饰容器（DecoratedBox）'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('背景色装饰'),
            const SizedBox(height: 8),
            _buildCard(
              title: '纯色背景',
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('纯色背景装饰'),
                ),
              ),
            ),
            _buildSectionTitle('渐变背景'),
            const SizedBox(height: 8),
            _buildCard(
              title: '线性渐变',
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue, Colors.purple],
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('线性渐变', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            _buildCard(
              title: '径向渐变',
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.center,
                    radius: 0.5,
                    colors: [Colors.red, Colors.orange, Colors.yellow],
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('径向渐变', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            _buildCard(
              title: '扫描渐变',
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: SweepGradient(
                    center: Alignment.center,
                    colors: [Colors.red, Colors.green, Colors.blue, Colors.red],
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('扫描渐变', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            _buildSectionTitle('边框装饰'),
            const SizedBox(height: 8),
            _buildCard(
              title: '实线边框',
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('实线边框'),
                ),
              ),
            ),
            _buildCard(
              title: '圆角边框',
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('圆角边框'),
                ),
              ),
            ),
            _buildCard(
              title: '不同边边框',
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: const Border(
                    top: BorderSide(color: Colors.red, width: 4),
                    bottom: BorderSide(color: Colors.blue, width: 4),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('上下边框不同'),
                ),
              ),
            ),
            _buildSectionTitle('阴影效果'),
            const SizedBox(height: 8),
            _buildCard(
              title: '单阴影',
              child: DecoratedBox(
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
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('单阴影'),
                ),
              ),
            ),
            _buildCard(
              title: '多层阴影',
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue,
                      offset: const Offset(2, 2),
                      blurRadius: 4,
                    ),
                    BoxShadow(
                      color: Colors.purple,
                      offset: const Offset(-2, -2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('多层阴影'),
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
            child,
          ],
        ),
      ),
    );
  }
}