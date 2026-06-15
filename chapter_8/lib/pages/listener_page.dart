import 'package:flutter/material.dart';

class ListenerPage extends StatefulWidget {
  const ListenerPage({super.key});

  @override
  State<ListenerPage> createState() => _ListenerPageState();
}

class _ListenerPageState extends State<ListenerPage> {
  PointerEvent? _event;
  String _behavior = 'deferToChild';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('8.1 原始指针事件处理')),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          _buildCard('Listener 监听触摸事件', [
            Listener(
              child: Container(
                height: 100,
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text(
                  '触摸我\n${_event?.localPosition.toString() ?? ''}',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
              onPointerDown: (e) => setState(() => _event = e),
              onPointerMove: (e) => setState(() => _event = e),
              onPointerUp: (e) => setState(() => _event = e),
            ),
          ]),
          _buildCard('IgnorePointer / AbsorbPointer', [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildPointerDemo('正常', null),
                _buildPointerDemo('Ignore', const IgnorePointer()),
                _buildPointerDemo('Absorb', const AbsorbPointer()),
              ],
            ),
          ]),
          _buildCard('HitTestBehavior', [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBehaviorButton('deferToChild'),
                _buildBehaviorButton('opaque'),
                _buildBehaviorButton('translucent'),
              ],
            ),
            const SizedBox(height: 6),
            Listener(
              behavior: _behavior == 'deferToChild'
                  ? HitTestBehavior.deferToChild
                  : _behavior == 'opaque'
                      ? HitTestBehavior.opaque
                      : HitTestBehavior.translucent,
              onPointerDown: (_) => _showSnack('外部被触发'),
              child: Container(
                height: 60,
                color: Colors.green.withOpacity(0.3),
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () => _showSnack('按钮被点击'),
                  child: const Text('点击我', style: TextStyle(fontSize: 12)),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildPointerDemo(String label, Widget? pointerWidget) {
    Widget child = GestureDetector(
      onTap: () => _showSnack('$label 被点击'),
      child: Container(
        width: 70,
        height: 50,
        color: Colors.orange,
        alignment: Alignment.center,
        child: Text(label, style: const TextStyle(fontSize: 11, color: Colors.white)),
      ),
    );
    if (pointerWidget is IgnorePointer) {
      child = IgnorePointer(child: child);
    } else if (pointerWidget is AbsorbPointer) {
      child = AbsorbPointer(child: child);
    }
    return child;
  }

  Widget _buildBehaviorButton(String behavior) {
    final selected = _behavior == behavior;
    return ElevatedButton(
      onPressed: () => setState(() => _behavior = behavior),
      style: ElevatedButton.styleFrom(
        backgroundColor: selected ? Colors.blue : Colors.grey[300],
        foregroundColor: selected ? Colors.white : Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        minimumSize: const Size(60, 28),
        textStyle: const TextStyle(fontSize: 11),
      ),
      child: Text(behavior),
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

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), duration: const Duration(milliseconds: 500)),
    );
  }
}
