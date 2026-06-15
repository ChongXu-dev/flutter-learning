import 'package:flutter/material.dart';
import 'pages/padding_page.dart';
import 'pages/decorated_box_page.dart';
import 'pages/transform_page.dart';
import 'pages/container_page.dart';
import 'pages/clip_page.dart';
import 'pages/fitted_box_page.dart';
import 'pages/scaffold_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter第五章学习',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/padding': (context) => const PaddingPage(),
        '/decorated-box': (context) => const DecoratedBoxPage(),
        '/transform': (context) => const TransformPage(),
        '/container': (context) => const ContainerPage(),
        '/clip': (context) => const ClipPage(),
        '/fitted-box': (context) => const FittedBoxPage(),
        '/scaffold': (context) => const ScaffoldPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> chapters = const [
    {
      'title': '5.1 填充（Padding）',
      'description': 'Padding组件用于给子组件添加内边距',
      'route': '/padding',
      'color': Colors.blue,
    },
    {
      'title': '5.2 装饰容器（DecoratedBox）',
      'description': 'DecoratedBox用于绘制背景、边框、渐变等装饰',
      'route': '/decorated-box',
      'color': Colors.green,
    },
    {
      'title': '5.3 变换（Transform）',
      'description': 'Transform实现平移、旋转、缩放等变换效果',
      'route': '/transform',
      'color': Colors.purple,
    },
    {
      'title': '5.4 Container容器',
      'description': 'Container是一个组合容器，集成了多种功能',
      'route': '/container',
      'color': Colors.orange,
    },
    {
      'title': '5.5 剪裁（Clip）',
      'description': 'Clip组件实现各种形状的剪裁效果',
      'route': '/clip',
      'color': Colors.red,
    },
    {
      'title': '5.6 空间适配（FittedBox）',
      'description': 'FittedBox控制子组件如何适应可用空间',
      'route': '/fitted-box',
      'color': Colors.teal,
    },
    {
      'title': '5.7 页面骨架（Scaffold）',
      'description': 'Scaffold是Material风格页面的骨架组件',
      'route': '/scaffold',
      'color': Colors.pink,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter实战 第五章'),
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
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Text(
                '容器类组件',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                '《Flutter实战》第五章学习内容',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ...chapters.map((chapter) => _buildChapterCard(context, chapter)),
          ],
        ),
      ),
    );
  }

  Widget _buildChapterCard(BuildContext context, Map<String, dynamic> chapter) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, chapter['route']);
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                width: 12,
                height: 80,
                decoration: BoxDecoration(
                  color: chapter['color'],
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chapter['title'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      chapter['description'],
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}