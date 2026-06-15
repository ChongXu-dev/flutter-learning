import 'package:flutter/material.dart';
import 'pages/layout_intro_page.dart';
import 'pages/layout_constraints_page.dart';
import 'pages/linear_layout_page.dart';
import 'pages/flex_layout_page.dart';
import 'pages/flow_layout_page.dart';
import 'pages/stack_layout_page.dart';
import 'pages/align_layout_page.dart';
import 'pages/layout_builder_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter第四章学习',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/layout-intro': (context) => const LayoutIntroPage(),
        '/layout-constraints': (context) => const LayoutConstraintsPage(),
        '/linear-layout': (context) => const LinearLayoutPage(),
        '/flex-layout': (context) => const FlexLayoutPage(),
        '/flow-layout': (context) => const FlowLayoutPage(),
        '/stack-layout': (context) => const StackLayoutPage(),
        '/align-layout': (context) => const AlignLayoutPage(),
        '/layout-builder': (context) => const LayoutBuilderPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> chapters = const [
    {
      'title': '4.1 布局类组件简介',
      'description': '了解Flutter布局组件的分类和作用',
      'route': '/layout-intro',
      'color': Colors.blue,
    },
    {
      'title': '4.2 布局原理与约束',
      'description': '理解constraints约束的传递和作用',
      'route': '/layout-constraints',
      'color': Colors.green,
    },
    {
      'title': '4.3 线性布局',
      'description': 'Row水平布局、Column垂直布局',
      'route': '/linear-layout',
      'color': Colors.purple,
    },
    {
      'title': '4.4 弹性布局',
      'description': 'Flex、Expanded、Flexible弹性布局',
      'route': '/flex-layout',
      'color': Colors.orange,
    },
    {
      'title': '4.5 流式布局',
      'description': 'Wrap、Flow自动换行布局',
      'route': '/flow-layout',
      'color': Colors.red,
    },
    {
      'title': '4.6 层叠布局',
      'description': 'Stack、Positioned层叠定位',
      'route': '/stack-layout',
      'color': Colors.teal,
    },
    {
      'title': '4.7 对齐与相对定位',
      'description': 'Align、Center对齐组件',
      'route': '/align-layout',
      'color': Colors.pink,
    },
    {
      'title': '4.8 LayoutBuilder',
      'description': 'LayoutBuilder、MediaQuery等',
      'route': '/layout-builder',
      'color': Colors.indigo,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter实战 第四章'),
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
                '布局类组件',
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
                '《Flutter实战》第四章学习内容',
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