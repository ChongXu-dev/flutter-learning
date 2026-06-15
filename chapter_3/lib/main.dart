import 'package:flutter/material.dart';
import 'pages/text_style_page.dart';
import 'pages/button_page.dart';
import 'pages/image_icon_page.dart';
import 'pages/checkbox_switch_page.dart';
import 'pages/input_form_page.dart';
import 'pages/progress_indicator_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter第三章学习',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/text-style': (context) => const TextStylePage(),
        '/button': (context) => const ButtonPage(),
        '/image-icon': (context) => const ImageIconPage(),
        '/checkbox-switch': (context) => const CheckboxSwitchPage(),
        '/input-form': (context) => const InputFormPage(),
        '/progress-indicator': (context) => const ProgressIndicatorPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> chapters = const [
    {
      'title': '3.1 文本及样式',
      'description': 'Text、TextStyle、RichText等文本组件',
      'route': '/text-style',
      'color': Colors.blue,
    },
    {
      'title': '3.2 按钮',
      'description': 'ElevatedButton、TextButton、OutlinedButton等',
      'route': '/button',
      'color': Colors.green,
    },
    {
      'title': '3.3 图片及ICON',
      'description': 'Image、Icon、IconButton等图标组件',
      'route': '/image-icon',
      'color': Colors.purple,
    },
    {
      'title': '3.4 单选开关和复选框',
      'description': 'Checkbox、Switch、Radio等选择组件',
      'route': '/checkbox-switch',
      'color': Colors.orange,
    },
    {
      'title': '3.5 输入框及表单',
      'description': 'TextField、Form、FormField等表单组件',
      'route': '/input-form',
      'color': Colors.red,
    },
    {
      'title': '3.6 进度指示器',
      'description': 'LinearProgressIndicator、CircularProgressIndicator',
      'route': '/progress-indicator',
      'color': Colors.teal,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter实战 第三章'),
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
                '基础组件',
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
                '《Flutter实战》第三章学习内容',
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