import 'package:flutter/material.dart';

class ImageIconPage extends StatelessWidget {
  const ImageIconPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3.3 图片及ICON'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Image组件'),
            const SizedBox(height: 16),
            _buildImageCard(
              title: '网络图片',
              child: Image.network(
                'https://picsum.photos/200/150',
                fit: BoxFit.cover,
              ),
            ),
            _buildImageCard(
              title: '圆角图片',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://picsum.photos/200/150?random=1',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            _buildImageCard(
              title: '圆形图片',
              child: ClipOval(
                child: Image.network(
                  'https://picsum.photos/150/150?random=2',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            _buildImageCard(
              title: 'BoxFit.contain',
              child: Image.network(
                'https://picsum.photos/200/150?random=3',
                fit: BoxFit.contain,
                width: 200,
                height: 150,
              ),
            ),
            _buildImageCard(
              title: 'BoxFit.fill',
              child: Image.network(
                'https://picsum.photos/200/150?random=4',
                fit: BoxFit.fill,
                width: 200,
                height: 150,
              ),
            ),
            _buildImageCard(
              title: 'BoxFit.cover',
              child: Image.network(
                'https://picsum.photos/200/150?random=5',
                fit: BoxFit.cover,
                width: 200,
                height: 150,
              ),
            ),
            _buildImageCard(
              title: '带占位符的图片',
              child: Image.network(
                'https://picsum.photos/200/150?random=6',
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            _buildSectionTitle('Icon组件'),
            const SizedBox(height: 16),
            _buildIconCard(
              title: 'Material Icons',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.home, size: 40),
                  Icon(Icons.settings, size: 40),
                  Icon(Icons.email, size: 40),
                  Icon(Icons.phone, size: 40),
                  Icon(Icons.map, size: 40),
                ],
              ),
            ),
            _buildIconCard(
              title: '自定义颜色图标',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.favorite, size: 40, color: Colors.red),
                  Icon(Icons.star, size: 40, color: Colors.yellow),
                  Icon(Icons.cloud, size: 40, color: Colors.blue),
                  Icon(Icons.eco, size: 40, color: Colors.green),
                  Icon(Icons.local_fire_department, size: 40, color: Colors.orange),
                ],
              ),
            ),
            _buildIconCard(
              title: '不同大小图标',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.sentiment_satisfied, size: 20, color: Colors.grey),
                  Icon(Icons.sentiment_satisfied, size: 30, color: Colors.blue),
                  Icon(Icons.sentiment_satisfied, size: 40, color: Colors.green),
                  Icon(Icons.sentiment_satisfied, size: 50, color: Colors.orange),
                ],
              ),
            ),
            _buildSectionTitle('IconButton组件'),
            const SizedBox(height: 16),
            _buildIconCard(
              title: 'IconButton示例',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.add),
                    iconSize: 36,
                    onPressed: () => _showSnackBar(context, '添加'),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    iconSize: 36,
                    color: Colors.red,
                    onPressed: () => _showSnackBar(context, '删除'),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    iconSize: 36,
                    color: Colors.blue,
                    onPressed: () => _showSnackBar(context, '编辑'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.purple,
      ),
    );
  }

  Widget _buildImageCard({required String title, required Widget child}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 12),
            Center(child: child),
          ],
        ),
      ),
    );
  }

  Widget _buildIconCard({required String title, required Widget child}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}