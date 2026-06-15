import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  String _msg = '等待通知...';

  void _update(String msg) => setState(() => _msg = msg);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('8.6 通知 Notification')),
      body: NotificationListener<MyNotification>(
        onNotification: (notification) {
          _update('收到: ${notification.msg}');
          return true;
        },
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            Card(
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text('状态: $_msg', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              ),
            ),
            _buildCard('自定义通知', [
              ElevatedButton(
                onPressed: () => MyNotification('Hello Notification').dispatch(context),
                child: const Text('发送自定义通知', style: TextStyle(fontSize: 12)),
              ),
            ]),
            _buildCard('滚动通知 (ScrollNotification)', [
              Container(
                height: 80,
                decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification is ScrollStartNotification) {
                      _update('滚动开始');
                    } else if (notification is ScrollUpdateNotification) {
                      _update('滚动中: ${notification.metrics.pixels.toStringAsFixed(1)}');
                    } else if (notification is ScrollEndNotification) {
                      _update('滚动结束');
                    }
                    return false;
                  },
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) => ListTile(
                      dense: true,
                      title: Text('Item $index', style: const TextStyle(fontSize: 12)),
                    ),
                  ),
                ),
              ),
            ]),
            _buildCard('通知冒泡', [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(4)),
                child: const Text(
                  '子组件发送通知向上冒泡\n父组件通过 NotificationListener 监听\n返回 true 阻止冒泡，false 继续冒泡',
                  style: TextStyle(fontSize: 11),
                ),
              ),
            ]),
          ],
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
}

class MyNotification extends Notification {
  final String msg;
  MyNotification(this.msg);
}
