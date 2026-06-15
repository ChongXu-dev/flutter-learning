import 'package:flutter/material.dart';

class ChunkedDownloadPage extends StatefulWidget {
  const ChunkedDownloadPage({super.key});

  @override
  State<ChunkedDownloadPage> createState() => _ChunkedDownloadPageState();
}

class _ChunkedDownloadPageState extends State<ChunkedDownloadPage> {
  double _progress = 0.0;
  bool _downloading = false;

  void _startDownload() async {
    setState(() {
      _downloading = true;
      _progress = 0;
    });
    for (var i = 0; i <= 10; i++) {
      await Future.delayed(const Duration(milliseconds: 200));
      setState(() => _progress = i / 10);
    }
    setState(() => _downloading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('11.4 分块下载器')),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          _buildCard('分块下载原理', [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(4)),
              child: const Text(
                '1. 获取文件总大小 (HEAD请求)\n'
                '2. 计算分块数量和每块大小\n'
                '3. 多线程并发下载各块\n'
                '4. Range: bytes=start-end\n'
                '5. 合并所有块为完整文件',
                style: TextStyle(fontSize: 11),
              ),
            ),
          ]),
          _buildCard('模拟下载进度', [
            LinearProgressIndicator(value: _progress, minHeight: 8),
            const SizedBox(height: 6),
            Text('进度: ${(_progress * 100).toStringAsFixed(0)}%', style: const TextStyle(fontSize: 12)),
            const SizedBox(height: 6),
            ElevatedButton(
              onPressed: _downloading ? null : _startDownload,
              child: Text(_downloading ? '下载中...' : '开始下载', style: const TextStyle(fontSize: 12)),
            ),
          ]),
          _buildCard('Range请求头', [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(4)),
              child: const Text(
                'request.headers.add(\n'
                '  "range",\n'
                '  "bytes=0-1023",\n'
                ');',
                style: TextStyle(color: Colors.green, fontSize: 11, fontFamily: 'monospace'),
              ),
            ),
          ]),
        ],
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
