import 'package:flutter/material.dart';

class GestureDetectorPage extends StatefulWidget {
  const GestureDetectorPage({super.key});

  @override
  State<GestureDetectorPage> createState() => _GestureDetectorPageState();
}

class _GestureDetectorPageState extends State<GestureDetectorPage> {
  String _gesture = '等待手势...';
  double _scale = 1.0;
  Offset _offset = Offset.zero;
  Offset _startOffset = Offset.zero;

  void _update(String msg) => setState(() => _gesture = msg);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('8.2 手势识别')),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Card(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text('当前: $_gesture', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ),
          ),
          _buildCard('点击/双击/长按', [
            GestureDetector(
              onTap: () => _update('单击'),
              onDoubleTap: () => _update('双击'),
              onLongPress: () => _update('长按'),
              child: Container(
                height: 60,
                color: Colors.blue,
                alignment: Alignment.center,
                child: const Text('点击 / 双击 / 长按', style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ),
          ]),
          _buildCard('垂直/水平拖动', [
            GestureDetector(
              onVerticalDragUpdate: (d) => _update('垂直拖动 dy:${d.delta.dy.toStringAsFixed(1)}'),
              onHorizontalDragUpdate: (d) => _update('水平拖动 dx:${d.delta.dx.toStringAsFixed(1)}'),
              child: Container(
                height: 60,
                color: Colors.green,
                alignment: Alignment.center,
                child: const Text('垂直或水平拖动', style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ),
          ]),
          _buildCard('缩放', [
            GestureDetector(
              onScaleStart: (_) => _startOffset = _offset,
              onScaleUpdate: (d) => setState(() {
                _scale = d.scale.clamp(0.5, 3.0);
                _offset = _startOffset + d.focalPointDelta;
                _update('缩放: ${_scale.toStringAsFixed(2)}');
              }),
              child: Container(
                height: 100,
                color: Colors.purple.withOpacity(0.1),
                alignment: Alignment.center,
                child: Transform.translate(
                  offset: _offset,
                  child: Transform.scale(
                    scale: _scale,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.purple,
                      alignment: Alignment.center,
                      child: const Text('缩放', style: TextStyle(color: Colors.white, fontSize: 11)),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildCard(String title, List<Widget> children) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            ...children,
          ],
        ),
      ),
    );
  }
}
