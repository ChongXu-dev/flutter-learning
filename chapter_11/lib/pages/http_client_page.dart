import 'package:flutter/material.dart';

class HttpClientPage extends StatefulWidget {
  const HttpClientPage({super.key});

  @override
  State<HttpClientPage> createState() => _HttpClientPageState();
}

class _HttpClientPageState extends State<HttpClientPage> {
  String _result = '';
  bool _loading = false;

  void _simulateRequest() async {
    setState(() {
      _loading = true;
      _result = '正在请求...';
    });
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _loading = false;
      _result = 'Status: 200 OK\nContent-Type: text/html; charset=utf-8\nLength: 12345';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('11.2 HttpClient')),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          _buildCard('HttpClient 五步请求', [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(4)),
              child: const Text(
                '1. HttpClient httpClient = HttpClient();\n'
                '2. HttpClientRequest request = await httpClient.getUrl(uri);\n'
                '3. HttpClientResponse response = await request.close();\n'
                '4. String body = await response.transform(utf8.decoder).join();\n'
                '5. httpClient.close();',
                style: TextStyle(fontSize: 11, fontFamily: 'monospace'),
              ),
            ),
          ]),
          _buildCard('模拟请求', [
            ElevatedButton(
              onPressed: _loading ? null : _simulateRequest,
              child: Text(_loading ? '请求中...' : '模拟GET请求', style: const TextStyle(fontSize: 12)),
            ),
            const SizedBox(height: 6),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(4)),
              child: Text(
                _result.isEmpty ? '点击按钮发起请求' : _result,
                style: const TextStyle(color: Colors.green, fontSize: 11, fontFamily: 'monospace'),
              ),
            ),
          ]),
          _buildCard('HttpClient配置', [
            _buildTag('findProxy 代理'),
            _buildTag('badCertificateCallback 证书校验'),
            _buildTag('idleTimeout 空闲超时'),
            _buildTag('connectionTimeout 连接超时'),
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
