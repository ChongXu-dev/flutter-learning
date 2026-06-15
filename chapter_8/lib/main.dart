import 'package:flutter/material.dart';
import 'pages/listener_page.dart';
import 'pages/gesture_detector_page.dart';
import 'pages/event_mechanism_page.dart';
import 'pages/gesture_conflict_page.dart';
import 'pages/event_bus_page.dart';
import 'pages/notification_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter第八章学习',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/listener': (context) => const ListenerPage(),
        '/gesture-detector': (context) => const GestureDetectorPage(),
        '/event-mechanism': (context) => const EventMechanismPage(),
        '/gesture-conflict': (context) => const GestureConflictPage(),
        '/event-bus': (context) => const EventBusPage(),
        '/notification': (context) => const NotificationPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> chapters = const [
    {
      'title': '8.1 原始指针事件处理',
      'description': 'Listener组件监听原始触摸事件',
      'route': '/listener',
      'color': Colors.blue,
    },
    {
      'title': '8.2 手势识别',
      'description': 'GestureDetector手势检测与识别',
      'route': '/gesture-detector',
      'color': Colors.green,
    },
    {
      'title': '8.3 Flutter事件机制',
      'description': '命中测试与事件分发流程',
      'route': '/event-mechanism',
      'color': Colors.purple,
    },
    {
      'title': '8.4 手势原理与冲突',
      'description': '手势竞争与冲突处理机制',
      'route': '/gesture-conflict',
      'color': Colors.orange,
    },
    {
      'title': '8.5 事件总线',
      'description': '全局事件总线实现跨组件通信',
      'route': '/event-bus',
      'color': Colors.red,
    },
    {
      'title': '8.6 通知 Notification',
      'description': 'Notification通知机制与冒泡',
      'route': '/notification',
      'color': Colors.teal,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter实战 第八章'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue[50]!, Colors.purple[50]!],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            const SizedBox(height: 8),
            const Center(
              child: Text(
                '事件处理与通知',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
            ),
            const SizedBox(height: 8),
            ...chapters.map((chapter) => _buildCard(context, chapter)),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, Map<String, dynamic> chapter) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      elevation: 2,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, chapter['route']),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: chapter['color'].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.touch_app,
                  color: chapter['color'],
                  size: 20,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chapter['title'],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      chapter['description'],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: chapter['color'],
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
