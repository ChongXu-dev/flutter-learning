import 'package:flutter/material.dart';

class FileOperationPage extends StatefulWidget {
  const FileOperationPage({super.key});

  @override
  State<FileOperationPage> createState() => _FileOperationPageState();
}

class _FileOperationPageState extends State<FileOperationPage> {
  final Map<String, String> _paths = {
    '临时目录': '/data/user/0/com.example/cache/',
    '文档目录': '/data/user/0/com.example/app_flutter/',
    '外部存储': '/storage/emulated/0/Android/data/com.example/files/',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('11.1 文件操作')),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          _buildCard('PathProvider 路径', [
            ..._paths.entries.map((e) => ListTile(
              dense: true,
              title: Text(e.key, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              subtitle: Text(e.value, style: TextStyle(fontSize: 11, color: Colors.grey[600])),
            )),
          ]),
          _buildCard('文件读写示例', [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(4)),
              child: const Text(
                'Future<File> getLocalFile() async {\n'
                '  String dir = (await getApplicationDocumentsDirectory()).path;\n'
                '  return File("\$dir/counter.txt");\n'
                '}\n'
                'await file.writeAsString("\$counter");\n'
                'String contents = await file.readAsString();',
                style: TextStyle(fontSize: 11, fontFamily: 'monospace'),
              ),
            ),
          ]),
          _buildCard('常用方法', [
            _buildTag('readAsString()'),
            _buildTag('writeAsString()'),
            _buildTag('readAsBytes()'),
            _buildTag('writeAsBytes()'),
            _buildTag('exists()'),
            _buildTag('create()'),
            _buildTag('delete()'),
            _buildTag('rename()'),
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
            ...children,
          ],
        ),
      ),
    );
  }
}
