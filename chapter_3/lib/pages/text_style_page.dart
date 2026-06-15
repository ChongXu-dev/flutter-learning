import 'package:flutter/material.dart';

class TextStylePage extends StatelessWidget {
  const TextStylePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3.1 文本及样式'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Text组件基础'),
            const SizedBox(height: 16),
            _buildTextCard(
              title: '普通文本',
              child: const Text('这是一段普通文本'),
            ),
            _buildTextCard(
              title: '设置字体大小',
              child: const Text(
                '字体大小为20',
                style: TextStyle(fontSize: 20),
              ),
            ),
            _buildTextCard(
              title: '设置字体粗细',
              child: const Text(
                '字体粗细为Bold',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            _buildTextCard(
              title: '设置字体颜色',
              child: const Text(
                '字体颜色为红色',
                style: TextStyle(color: Colors.red),
              ),
            ),
            _buildTextCard(
              title: '设置字体样式',
              child: const Text(
                '斜体文本',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            _buildTextCard(
              title: '设置行高',
              child: const Text(
                '这是一段设置了行高的文本，行高为1.8，可以使文本更加易读。',
                style: TextStyle(height: 1.8),
              ),
            ),
            _buildSectionTitle('文本对齐'),
            const SizedBox(height: 16),
            _buildTextCard(
              title: '左对齐',
              child: const Text(
                '这是一段左对齐的文本，文本会沿着左边对齐显示。',
                textAlign: TextAlign.left,
              ),
            ),
            _buildTextCard(
              title: '居中对齐',
              child: const Text(
                '这是一段居中对齐的文本，文本会在中间显示。',
                textAlign: TextAlign.center,
              ),
            ),
            _buildTextCard(
              title: '右对齐',
              child: const Text(
                '这是一段右对齐的文本，文本会沿着右边对齐显示。',
                textAlign: TextAlign.right,
              ),
            ),
            _buildTextCard(
              title: '两端对齐',
              child: const Text(
                '这是一段两端对齐的文本，文本会在左右两边都对齐，使每行的宽度一致。',
                textAlign: TextAlign.justify,
              ),
            ),
            _buildSectionTitle('RichText富文本'),
            const SizedBox(height: 16),
            _buildTextCard(
              title: '富文本示例',
              child: RichText(
                text: const TextSpan(
                  text: 'Hello ',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  children: [
                    TextSpan(
                      text: 'Flutter',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    TextSpan(
                      text: '! ',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    TextSpan(
                      text: '这是富文本',
                      style: TextStyle(
                        color: Colors.red,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildSectionTitle('文本溢出处理'),
            const SizedBox(height: 16),
            _buildTextCard(
              title: '省略号省略',
              child: const Text(
                '这是一段非常长的文本，用于演示文本溢出时的处理方式，当文本超过一行时会显示省略号。',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            _buildTextCard(
              title: '裁剪溢出',
              child: const Text(
                '这是一段非常长的文本，用于演示文本溢出时的裁剪处理方式。',
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
            ),
            _buildTextCard(
              title: '渐隐溢出',
              child: const Text(
                '这是一段非常长的文本，用于演示文本溢出时的渐隐处理方式。',
                maxLines: 1,
                overflow: TextOverflow.fade,
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

  Widget _buildTextCard({required String title, required Widget child}) {
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
            const SizedBox(height: 8),
            child,
          ],
        ),
      ),
    );
  }
}