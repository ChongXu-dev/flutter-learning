import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class GestureConflictPage extends StatefulWidget {
  const GestureConflictPage({super.key});

  @override
  State<GestureConflictPage> createState() => _GestureConflictPageState();
}

class _GestureConflictPageState extends State<GestureConflictPage> {
  String _result = '';

  void _log(String msg) => setState(() => _result = msg);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('8.4 手势原理与冲突')),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Card(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text('结果: $_result', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
            ),
          ),
          _buildCard('手势竞争 (Gesture Arena)', [
            const Text('多个手势识别器同时竞争时，只有一个会胜出', style: TextStyle(fontSize: 12)),
            const SizedBox(height: 6),
            GestureDetector(
              onTap: () => _log('外层胜出'),
              child: Container(
                height: 70,
                color: Colors.blue.withOpacity(0.3),
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () => _log('内层胜出'),
                  child: Container(
                    width: 120,
                    height: 40,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: const Text('点击我', style: TextStyle(color: Colors.white, fontSize: 11)),
                  ),
                ),
              ),
            ),
          ]),
          _buildCard('解决冲突 - 自定义识别器', [
            const Text('RawGestureDetector 可自定义手势识别', style: TextStyle(fontSize: 12)),
            const SizedBox(height: 6),
            RawGestureDetector(
              gestures: {
                TapGestureRecognizer: GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
                  () => TapGestureRecognizer(),
                  (instance) => instance.onTap = () => _log('RawGestureDetector 点击'),
                ),
              },
              child: Container(
                height: 50,
                color: Colors.orange,
                alignment: Alignment.center,
                child: const Text('RawGestureDetector', style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ),
          ]),
          _buildCard('冲突场景 - 滑动与点击', [
            const Text('ListView中的Item点击需要特殊处理', style: TextStyle(fontSize: 12)),
            const SizedBox(height: 6),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => _log('点击 Item $index'),
                  child: Container(
                    width: 60,
                    margin: const EdgeInsets.only(right: 8),
                    color: Colors.teal,
                    alignment: Alignment.center,
                    child: Text('Item $index', style: const TextStyle(color: Colors.white, fontSize: 11)),
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
