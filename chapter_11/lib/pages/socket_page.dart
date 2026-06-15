import 'package:flutter/material.dart';

class SocketPage extends StatelessWidget {
  const SocketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('11.5 Socket请求')),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          _buildCard('Socket HTTP请求', [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(4)),
              child: const Text(
                'Socket socket = await Socket.connect("flutterchina.club", 80);\n'
                'socket.write("GET / HTTP/1.1\\r\\n"\n'
                '  "Host: flutterchina.club\\r\\n"\n'
                '  "Connection: close\\r\\n\\r\\n");\n'
                'await socket.listen((data) {\n'
                '  print(utf8.decode(data));\n'
                '}).asFuture();',
                style: TextStyle(fontSize: 11, fontFamily: 'monospace'),
              ),
            ),
          ]),
          _buildCard('WebSocket', [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(4)),
              child: const Text(
                'WebSocketChannel channel = IOWebSocketChannel.connect(\n'
                '  "wss://echo.websocket.org");\n'
                'channel.stream.listen((message) {\n'
                '  print("收到: \$message");\n'
                '});\n'
                'channel.sink.add("Hello!");',
                style: TextStyle(fontSize: 11, fontFamily: 'monospace'),
              ),
            ),
          ]),
          _buildCard('对比', [
            DataTable(
              headingRowHeight: 32,
              dataRowMinHeight: 28,
              dataRowMaxHeight: 32,
              columns: const [
                DataColumn(label: Text('特性', style: TextStyle(fontSize: 11))),
                DataColumn(label: Text('Socket', style: TextStyle(fontSize: 11))),
                DataColumn(label: Text('WebSocket', style: TextStyle(fontSize: 11))),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text('协议', style: TextStyle(fontSize: 11))),
                  DataCell(Text('TCP', style: TextStyle(fontSize: 11))),
                  DataCell(Text('WebSocket', style: TextStyle(fontSize: 11))),
                ]),
                DataRow(cells: [
                  DataCell(Text('通信', style: TextStyle(fontSize: 11))),
                  DataCell(Text('全双工', style: TextStyle(fontSize: 11))),
                  DataCell(Text('全双工', style: TextStyle(fontSize: 11))),
                ]),
                DataRow(cells: [
                  DataCell(Text('场景', style: TextStyle(fontSize: 11))),
                  DataCell(Text('底层通信', style: TextStyle(fontSize: 11))),
                  DataCell(Text('实时推送', style: TextStyle(fontSize: 11))),
                ]),
              ],
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
