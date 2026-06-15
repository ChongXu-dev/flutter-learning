import 'package:flutter/material.dart';

class EventMechanismPage extends StatelessWidget {
  const EventMechanismPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('8.3 Flutter事件机制')),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          _buildCard('事件处理流程', [
            _buildFlowItem('1. PointerDownEvent', '手指按下，触发命中测试'),
            _buildFlowItem('2. HitTest', '深度优先遍历渲染树进行命中测试'),
            _buildFlowItem('3. Event Dispatch', '遍历HitTestResult分发事件'),
            _buildFlowItem('4. PointerMoveEvent', '手指移动时继续分发'),
            _buildFlowItem('5. PointerUpEvent', '手指抬起，分发后清理'),
          ]),
          _buildCard('命中测试顺序', [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(4)),
              child: const Text(
                '子组件优先于父组件响应事件\n深度优先 => 子组件先加入 HitTestResult',
                style: TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(height: 6),
            _buildHitTestDemo(),
          ]),
          _buildCard('事件冒泡', [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(4)),
              child: const Text(
                'Flutter事件从最内部组件向根组件冒泡\n没有机制可以取消或停止冒泡过程',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildFlowItem(String title, String desc) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
            child: const Icon(Icons.check, color: Colors.white, size: 12),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                Text(desc, style: TextStyle(fontSize: 11, color: Colors.grey[600])),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHitTestDemo() {
    return GestureDetector(
      onTap: () => _showSnack('外层父组件'),
      child: Container(
        height: 80,
        color: Colors.blue.withOpacity(0.3),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () => _showSnack('内层子组件'),
          child: Container(
            width: 100,
            height: 40,
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text('点击我', style: TextStyle(color: Colors.white, fontSize: 11)),
          ),
        ),
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

  void _showSnack(String msg) {
    // 使用静态context不可行，这里仅做展示
  }
}
