import 'package:flutter/material.dart';

class LayoutBuilderPage extends StatelessWidget {
  const LayoutBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('4.8 LayoutBuilder'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('LayoutBuilder'),
            const SizedBox(height: 8),
            Card(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: const Text(
                  'LayoutBuilder 可获取父容器约束信息\n'
                  '通过 BoxConstraints 进行响应式布局',
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ),
            const SizedBox(height: 12),
            _buildSectionTitle('MediaQuery 屏幕信息'),
            const SizedBox(height: 8),
            Card(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: Text(
                  '屏幕宽度: ${size.width.round()}\n'
                  '屏幕高度: ${size.height.round()}\n'
                  '方向: ${size.width > size.height ? "横屏" : "竖屏"}',
                  style: const TextStyle(fontSize: 13),
                ),
              ),
            ),
            const SizedBox(height: 12),
            _buildSectionTitle('响应式布局'),
            const SizedBox(height: 8),
            SizedBox(
              height: 100,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: size.width > 600
                      ? Row(
                          children: [
                            Expanded(child: Container(color: Colors.red)),
                            Expanded(child: Container(color: Colors.green)),
                            Expanded(child: Container(color: Colors.blue)),
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(child: Container(color: Colors.red)),
                            Expanded(child: Container(color: Colors.green)),
                          ],
                        ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            _buildSectionTitle('AspectRatio'),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: const [
                          Text('16:9', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          AspectRatio(aspectRatio: 16/9, child: ColoredBox(color: Colors.blue)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: const [
                          Text('1:1', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          AspectRatio(aspectRatio: 1, child: ColoredBox(color: Colors.red)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildSectionTitle('ConstrainedBox'),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          const Text('minHeight', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          ConstrainedBox(
                            constraints: const BoxConstraints(minHeight: 60),
                            child: Container(height: 30, color: Colors.orange),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          const Text('maxWidth', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 80),
                            child: Container(height: 40, color: Colors.purple),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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
}