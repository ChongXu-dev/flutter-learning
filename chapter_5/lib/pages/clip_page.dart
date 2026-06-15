import 'package:flutter/material.dart';

class ClipPage extends StatelessWidget {
  const ClipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('5.5 剪裁（Clip）'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('ClipOval 椭圆剪裁'),
            const SizedBox(height: 8),
            _buildCard(
              title: '圆形剪裁',
              child: ClipOval(
                child: Container(
                  width: 80,
                  height: 80,
                  color: Colors.blue,
                  child: const Center(
                    child: Text('圆形', style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ),
              ),
            ),
            _buildCard(
              title: '椭圆剪裁',
              child: ClipOval(
                child: Container(
                  width: 120,
                  height: 60,
                  color: Colors.green,
                  child: const Center(
                    child: Text('椭圆', style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ),
              ),
            ),
            _buildCard(
              title: '圆形图片',
              child: ClipOval(
                child: Image.network(
                  'https://picsum.photos/100/100',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            _buildSectionTitle('ClipRRect 圆角矩形'),
            const SizedBox(height: 8),
            _buildCard(
              title: '圆角容器',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 140,
                  height: 50,
                  color: Colors.orange,
                  child: const Center(
                    child: Text('圆角矩形', style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ),
              ),
            ),
            _buildCard(
              title: '对角圆角',
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                child: Container(
                  width: 140,
                  height: 50,
                  color: Colors.purple,
                  child: const Center(
                    child: Text('对角圆角', style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ),
              ),
            ),
            _buildCard(
              title: '圆角图片',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://picsum.photos/150/80',
                  width: 140,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            _buildSectionTitle('ClipPath 自定义路径'),
            const SizedBox(height: 8),
            _buildCard(
              title: '三角形剪裁',
              child: ClipPath(
                clipper: TriangleClipper(),
                child: Container(
                  width: 80,
                  height: 80,
                  color: Colors.red,
                  child: const Center(
                    child: Text('三角', style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ),
              ),
            ),
            _buildCard(
              title: '波浪形剪裁',
              child: ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  width: 150,
                  height: 50,
                  color: Colors.teal,
                  child: const Center(
                    child: Text('波浪形', style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ),
              ),
            ),
            _buildSectionTitle('ClipRect 矩形剪裁'),
            const SizedBox(height: 8),
            _buildCard(
              title: '裁剪超出部分',
              child: ClipRect(
                child: Align(
                  alignment: Alignment.topCenter,
                  heightFactor: 0.5,
                  child: Image.network(
                    'https://picsum.photos/150/100',
                    width: 140,
                    fit: BoxFit.cover,
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
            Center(child: child),
          ],
        ),
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height / 2);
    path.quadraticBezierTo(
      size.width / 4,
      0,
      size.width / 2,
      size.height / 2,
    );
    path.quadraticBezierTo(
      size.width * 3 / 4,
      size.height,
      size.width,
      size.height / 2,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}