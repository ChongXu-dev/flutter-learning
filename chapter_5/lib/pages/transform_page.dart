import 'package:flutter/material.dart';

class TransformPage extends StatelessWidget {
  const TransformPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('5.3 变换（Transform）'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('平移变换'),
            const SizedBox(height: 8),
            _buildCard(
              title: '水平平移',
              child: Center(
                child: Transform.translate(
                  offset: const Offset(20, 0),
                  child: Container(
                    width: 80,
                    height: 40,
                    color: Colors.blue,
                    child: const Center(
                      child: Text('水平', style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ),
                ),
              ),
            ),
            _buildCard(
              title: '垂直平移',
              child: Center(
                child: Transform.translate(
                  offset: const Offset(0, 15),
                  child: Container(
                    width: 80,
                    height: 40,
                    color: Colors.green,
                    child: const Center(
                      child: Text('垂直', style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ),
                ),
              ),
            ),
            _buildCard(
              title: '对角平移',
              child: Center(
                child: Transform.translate(
                  offset: const Offset(15, 8),
                  child: Container(
                    width: 80,
                    height: 40,
                    color: Colors.orange,
                    child: const Center(
                      child: Text('对角', style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ),
                ),
              ),
            ),
            _buildSectionTitle('旋转变换'),
            const SizedBox(height: 8),
            _buildCard(
              title: '顺时针45°',
              child: Center(
                child: Transform.rotate(
                  angle: 45 * 3.14159 / 180,
                  child: Container(
                    width: 80,
                    height: 40,
                    color: Colors.purple,
                    child: const Center(
                      child: Text('45°', style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ),
                ),
              ),
            ),
            _buildCard(
              title: '逆时针30°',
              child: Center(
                child: Transform.rotate(
                  angle: -30 * 3.14159 / 180,
                  child: Container(
                    width: 80,
                    height: 40,
                    color: Colors.red,
                    child: const Center(
                      child: Text('-30°', style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ),
                ),
              ),
            ),
            _buildCard(
              title: '旋转180°',
              child: Center(
                child: Transform.rotate(
                  angle: 180 * 3.14159 / 180,
                  child: Container(
                    width: 80,
                    height: 40,
                    color: Colors.teal,
                    child: const Center(
                      child: Text('180°', style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ),
                ),
              ),
            ),
            _buildSectionTitle('缩放变换'),
            const SizedBox(height: 8),
            _buildCard(
              title: '放大1.5倍',
              child: Center(
                child: Transform.scale(
                  scale: 1.5,
                  child: Container(
                    width: 50,
                    height: 30,
                    color: Colors.blue,
                    child: const Center(
                      child: Text('放大', style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ),
                ),
              ),
            ),
            _buildCard(
              title: '缩小0.5倍',
              child: Center(
                child: Transform.scale(
                  scale: 0.5,
                  child: Container(
                    width: 80,
                    height: 40,
                    color: Colors.green,
                    child: const Center(
                      child: Text('缩小', style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ),
                ),
              ),
            ),
            _buildCard(
              title: '非均匀缩放',
              child: Center(
                child: Transform.scale(
                  scaleX: 1.8,
                  scaleY: 0.7,
                  child: Container(
                    width: 50,
                    height: 40,
                    color: Colors.orange,
                    child: const Center(
                      child: Text('变形', style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ),
                ),
              ),
            ),
            _buildSectionTitle('组合变换'),
            const SizedBox(height: 8),
            _buildCard(
              title: '旋转+缩放',
              child: Center(
                child: Transform.rotate(
                  angle: 45 * 3.14159 / 180,
                  child: Transform.scale(
                    scale: 1.2,
                    child: Container(
                      width: 60,
                      height: 60,
                      color: Colors.purple,
                      child: const Center(
                        child: Text('组合', style: TextStyle(color: Colors.white, fontSize: 12)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            _buildCard(
              title: '平移+旋转+缩放',
              child: Center(
                child: Transform.translate(
                  offset: const Offset(15, 0),
                  child: Transform.rotate(
                    angle: 30 * 3.14159 / 180,
                    child: Transform.scale(
                      scale: 0.8,
                      child: Container(
                        width: 80,
                        height: 40,
                        color: Colors.red,
                        child: const Center(
                          child: Text('多重', style: TextStyle(color: Colors.white, fontSize: 12)),
                        ),
                      ),
                    ),
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