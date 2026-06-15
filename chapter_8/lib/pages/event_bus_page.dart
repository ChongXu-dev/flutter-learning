import 'package:flutter/material.dart';

class EventBusPage extends StatefulWidget {
  const EventBusPage({super.key});

  @override
  State<EventBusPage> createState() => _EventBusPageState();
}

class _EventBusPageState extends State<EventBusPage> {
  String _message = '等待事件...';

  @override
  void initState() {
    super.initState();
    bus.on('login', (arg) {
      setState(() => _message = '收到登录事件: $arg');
    });
    bus.on('logout', (arg) {
      setState(() => _message = '收到登出事件: $arg');
    });
  }

  @override
  void dispose() {
    bus.off('login');
    bus.off('logout');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('8.5 事件总线')),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Card(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text('状态: $_message', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
            ),
          ),
          _buildCard('发布事件', [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => bus.emit('login', '用户A'),
                  style: ElevatedButton.styleFrom(minimumSize: const Size(80, 32)),
                  child: const Text('登录事件', style: TextStyle(fontSize: 11)),
                ),
                ElevatedButton(
                  onPressed: () => bus.emit('logout', '用户A'),
                  style: ElevatedButton.styleFrom(minimumSize: const Size(80, 32)),
                  child: const Text('登出事件', style: TextStyle(fontSize: 11)),
                ),
                ElevatedButton(
                  onPressed: () => bus.emit('custom', '自定义数据'),
                  style: ElevatedButton.styleFrom(minimumSize: const Size(80, 32)),
                  child: const Text('自定义事件', style: TextStyle(fontSize: 11)),
                ),
              ],
            ),
          ]),
          _buildCard('事件总线实现', [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(4)),
              child: const Text(
                '单例模式 + Map存储订阅者\nkey: 事件名, value: 回调函数列表\nemit时反向遍历防止下标错位',
                style: TextStyle(fontSize: 11, fontFamily: 'monospace'),
              ),
            ),
          ]),
          _buildCard('使用场景', [
            _buildTag('跨页面通信'),
            _buildTag('登录状态变化通知'),
            _buildTag('主题切换通知'),
            _buildTag('数据刷新通知'),
          ]),
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Chip(
      label: Text(text, style: const TextStyle(fontSize: 11)),
      padding: const EdgeInsets.all(0),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
            Wrap(spacing: 6, runSpacing: 6, children: children),
          ],
        ),
      ),
    );
  }
}

// 全局事件总线
typedef EventCallback = void Function(dynamic arg);

class EventBus {
  EventBus._internal();
  static final EventBus _singleton = EventBus._internal();
  factory EventBus() => _singleton;

  final _emap = <Object, List<EventCallback>?>{};

  void on(eventName, EventCallback f) {
    _emap[eventName] ??= <EventCallback>[];
    _emap[eventName]!.add(f);
  }

  void off(eventName, [EventCallback? f]) {
    var list = _emap[eventName];
    if (list == null) return;
    if (f == null) {
      _emap[eventName] = null;
    } else {
      list.remove(f);
    }
  }

  void emit(eventName, [arg]) {
    var list = _emap[eventName];
    if (list == null) return;
    for (var i = list.length - 1; i > -1; --i) {
      list[i](arg);
    }
  }
}

var bus = EventBus();
