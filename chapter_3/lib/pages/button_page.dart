import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3.2 按钮'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Material3 按钮'),
            const SizedBox(height: 16),
            _buildButtonCard(
              title: 'ElevatedButton（凸起按钮）',
              child: ElevatedButton(
                onPressed: () => _showSnackBar(context, 'ElevatedButton 被点击'),
                child: const Text('点击我'),
              ),
            ),
            _buildButtonCard(
              title: 'ElevatedButton（带图标）',
              child: ElevatedButton.icon(
                onPressed: () => _showSnackBar(context, 'ElevatedButton.icon 被点击'),
                icon: const Icon(Icons.add),
                label: const Text('添加'),
              ),
            ),
            _buildButtonCard(
              title: 'TextButton（文本按钮）',
              child: TextButton(
                onPressed: () => _showSnackBar(context, 'TextButton 被点击'),
                child: const Text('点击我'),
              ),
            ),
            _buildButtonCard(
              title: 'TextButton（带图标）',
              child: TextButton.icon(
                onPressed: () => _showSnackBar(context, 'TextButton.icon 被点击'),
                icon: const Icon(Icons.favorite),
                label: const Text('收藏'),
              ),
            ),
            _buildButtonCard(
              title: 'OutlinedButton（轮廓按钮）',
              child: OutlinedButton(
                onPressed: () => _showSnackBar(context, 'OutlinedButton 被点击'),
                child: const Text('点击我'),
              ),
            ),
            _buildButtonCard(
              title: 'OutlinedButton（带图标）',
              child: OutlinedButton.icon(
                onPressed: () => _showSnackBar(context, 'OutlinedButton.icon 被点击'),
                icon: const Icon(Icons.share),
                label: const Text('分享'),
              ),
            ),
            _buildSectionTitle('按钮状态'),
            const SizedBox(height: 16),
            _buildButtonCard(
              title: '禁用状态按钮',
              child: ElevatedButton(
                onPressed: null,
                child: const Text('禁用按钮'),
              ),
            ),
            _buildSectionTitle('自定义按钮样式'),
            const SizedBox(height: 16),
            _buildButtonCard(
              title: '自定义颜色',
              child: ElevatedButton(
                onPressed: () => _showSnackBar(context, '自定义颜色按钮被点击'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: const Text('绿色按钮'),
              ),
            ),
            _buildButtonCard(
              title: '自定义圆角',
              child: ElevatedButton(
                onPressed: () => _showSnackBar(context, '自定义圆角按钮被点击'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('圆角按钮'),
              ),
            ),
            _buildButtonCard(
              title: '自定义大小',
              child: ElevatedButton(
                onPressed: () => _showSnackBar(context, '自定义大小按钮被点击'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                ),
                child: const Text('大按钮'),
              ),
            ),
            _buildSectionTitle('IconButton（图标按钮）'),
            const SizedBox(height: 16),
            _buildButtonCard(
              title: 'IconButton',
              child: IconButton(
                onPressed: () => _showSnackBar(context, 'IconButton 被点击'),
                icon: const Icon(Icons.favorite),
                color: Colors.red,
              ),
            ),
            _buildButtonCard(
              title: 'IconButton（不同大小）',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () => _showSnackBar(context, '小图标按钮被点击'),
                    icon: const Icon(Icons.star),
                    iconSize: 20,
                  ),
                  IconButton(
                    onPressed: () => _showSnackBar(context, '中等图标按钮被点击'),
                    icon: const Icon(Icons.star),
                    iconSize: 30,
                  ),
                  IconButton(
                    onPressed: () => _showSnackBar(context, '大图标按钮被点击'),
                    icon: const Icon(Icons.star),
                    iconSize: 40,
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
        color: Colors.green,
      ),
    );
  }

  Widget _buildButtonCard({required String title, required Widget child}) {
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
}