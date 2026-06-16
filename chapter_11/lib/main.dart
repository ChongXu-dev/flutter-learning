import 'package:flutter/material.dart';
import 'pages/file_operation_page.dart';
import 'pages/http_client_page.dart';
import 'pages/dio_page.dart';
import 'pages/chunked_download_page.dart';
import 'pages/socket_page.dart';
import 'pages/json_model_page.dart';
import 'pages/extended_counter_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter第十一章学习',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/file-operation': (context) => const FileOperationPage(),
        '/http-client': (context) => const HttpClientPage(),
        '/dio': (context) => const DioPage(),
        '/chunked-download': (context) => const ChunkedDownloadPage(),
        '/socket': (context) => const SocketPage(),
        '/json-model': (context) => const JsonModelPage(),
        '/extended-counter': (context) => const ExtendedCounterPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> chapters = const [
    {
      'title': '11.1 文件操作',
      'description': '使用path_provider访问文件系统',
      'route': '/file-operation',
      'color': Colors.blue,
    },
    {
      'title': '11.2 HttpClient',
      'description': 'Dart IO库发起HTTP请求',
      'route': '/http-client',
      'color': Colors.green,
    },
    {
      'title': '11.3 Dio http库',
      'description': '强大的Dart HTTP请求库',
      'route': '/dio',
      'color': Colors.purple,
    },
    {
      'title': '11.4 分块下载器',
      'description': '多线程分块下载实现',
      'route': '/chunked-download',
      'color': Colors.orange,
    },
    {
      'title': '11.5 Socket请求',
      'description': '使用Socket实现HTTP请求',
      'route': '/socket',
      'color': Colors.red,
    },
    {
      'title': '11.6 JSON转Model',
      'description': 'JSON解析与Dart Model转换',
      'route': '/json-model',
      'color': Colors.teal,
    },
    {
      'title': '扩展功能：持久化计数器',
      'description': '基于文件操作的计数器数据持久化',
      'route': '/extended-counter',
      'color': Colors.indigo,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter实战 第十一章'),
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
                '文件操作与网络请求',
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
                  Icons.network_wifi,
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
