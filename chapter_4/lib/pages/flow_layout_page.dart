import 'package:flutter/material.dart';

class FlowLayoutPage extends StatelessWidget {
  const FlowLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('4.5 流式布局'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Wrap 流式布局'),
            const SizedBox(height: 8),
            _buildFlowCard('基本Wrap', Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                Container(width: 80, height: 40, color: Colors.red),
                Container(width: 100, height: 40, color: Colors.green),
                Container(width: 70, height: 40, color: Colors.blue),
                Container(width: 90, height: 40, color: Colors.orange),
                Container(width: 60, height: 40, color: Colors.purple),
              ],
            )),
            const SizedBox(height: 8),
            _buildFlowCard('居中对齐', Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              children: [
                Container(width: 60, height: 40, color: Colors.red),
                Container(width: 80, height: 40, color: Colors.green),
                Container(width: 70, height: 40, color: Colors.blue),
              ],
            )),
            const SizedBox(height: 12),
            _buildSectionTitle('Flow 流式布局'),
            const SizedBox(height: 8),
            SizedBox(
              height: 100,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Flow(
                    delegate: TestFlowDelegate(margin: const EdgeInsets.all(8)),
                    children: [
                      Container(width: 80, height: 40, color: Colors.red),
                      Container(width: 100, height: 40, color: Colors.green),
                      Container(width: 70, height: 40, color: Colors.blue),
                      Container(width: 90, height: 40, color: Colors.orange),
                      Container(width: 60, height: 40, color: Colors.purple),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            _buildSectionTitle('标签云效果'),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: const [
                    Chip(label: Text('Flutter')),
                    Chip(label: Text('Dart')),
                    Chip(label: Text('Android')),
                    Chip(label: Text('iOS')),
                    Chip(label: Text('Web')),
                    Chip(label: Text('Layout')),
                    Chip(label: Text('Widget')),
                  ],
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

  Widget _buildFlowCard(String title, Widget child) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            child,
          ],
        ),
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin;

  TestFlowDelegate({this.margin = EdgeInsets.zero});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i)!.width;
      var h = context.getChildSize(i)!.height;
      if (x + w > context.size.width) {
        x = margin.left;
        y += h + margin.bottom;
      }
      context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
      x += w + margin.right;
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}