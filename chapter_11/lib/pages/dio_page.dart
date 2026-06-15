import 'package:flutter/material.dart';

class DioPage extends StatefulWidget {
  const DioPage({super.key});

  @override
  State<DioPage> createState() => _DioPageState();
}

class _DioPageState extends State<DioPage> {
  String _result = '';

  void _showCode(String type) {
    String code = '';
    switch (type) {
      case 'get':
        code = 'Response response = await dio.get("/test",\n  queryParameters: {"id": 12});';
        break;
      case 'post':
        code = 'Response response = await dio.post("/test",\n  data: {"id": 12, "name": "wendu"});';
        break;
      case 'download':
        code = 'await dio.download(\n  "https://example.com/file.zip",\n  "/save/path/file.zip");';
        break;
      case 'form':
        code = 'FormData formData = FormData.fromMap({\n  "name": "wendux",\n  "file": await MultipartFile.fromFile("./upload.txt")\n});\nawait dio.post("/upload", data: formData);';
        break;
    }
    setState(() => _result = code);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('11.3 Dio http库')),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          _buildCard('Dio 特点', [
            _buildTag('Restful API'),
            _buildTag('拦截器'),
            _buildTag('请求取消'),
            _buildTag('Cookie管理'),
            _buildTag('文件上传/下载'),
            _buildTag('超时配置'),
            _buildTag('FormData'),
          ]),
          _buildCard('请求示例', [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => _showCode('get'),
                  style: ElevatedButton.styleFrom(minimumSize: const Size(60, 32)),
                  child: const Text('GET', style: TextStyle(fontSize: 11)),
                ),
                ElevatedButton(
                  onPressed: () => _showCode('post'),
                  style: ElevatedButton.styleFrom(minimumSize: const Size(60, 32)),
                  child: const Text('POST', style: TextStyle(fontSize: 11)),
                ),
                ElevatedButton(
                  onPressed: () => _showCode('download'),
                  style: ElevatedButton.styleFrom(minimumSize: const Size(60, 32)),
                  child: const Text('下载', style: TextStyle(fontSize: 11)),
                ),
                ElevatedButton(
                  onPressed: () => _showCode('form'),
                  style: ElevatedButton.styleFrom(minimumSize: const Size(60, 32)),
                  child: const Text('Form', style: TextStyle(fontSize: 11)),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(4)),
              child: Text(
                _result.isEmpty ? '点击按钮查看代码' : _result,
                style: const TextStyle(color: Colors.green, fontSize: 11, fontFamily: 'monospace'),
              ),
            ),
          ]),
          _buildCard('拦截器示例', [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(4)),
              child: const Text(
                'dio.interceptors.add(InterceptorsWrapper(\n'
                '  onRequest: (options, handler) {\n'
                '    print("请求之前");\n'
                '    return handler.next(options);\n'
                '  },\n'
                '  onResponse: (response, handler) {\n'
                '    print("响应之前");\n'
                '    return handler.next(response);\n'
                '  },\n'
                '  onError: (DioError e, handler) {\n'
                '    print("错误之前");\n'
                '    return handler.next(e);\n'
                '  },\n'
                '));',
                style: TextStyle(fontSize: 11, fontFamily: 'monospace'),
              ),
            ),
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
