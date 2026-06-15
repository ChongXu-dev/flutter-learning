import 'package:flutter/material.dart';

class JsonModelPage extends StatelessWidget {
  const JsonModelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('11.6 JSON转Model')),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          _buildCard('手动解析', [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(4)),
              child: const Text(
                'class User {\n'
                '  final String name;\n'
                '  final int age;\n'
                '  User({required this.name, required this.age});\n\n'
                '  factory User.fromJson(Map<String, dynamic> json) {\n'
                '    return User(\n'
                '      name: json["name"],\n'
                '      age: json["age"],\n'
                '    );\n'
                '  }\n\n'
                '  Map<String, dynamic> toJson() => {\n'
                '    "name": name,\n'
                '    "age": age,\n'
                '  };\n'
                '}',
                style: TextStyle(fontSize: 11, fontFamily: 'monospace'),
              ),
            ),
          ]),
          _buildCard('json_serializable 自动生成', [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(4)),
              child: const Text(
                '@JsonSerializable()\n'
                'class User {\n'
                '  String name;\n'
                '  int age;\n'
                '  User(this.name, this.age);\n\n'
                '  factory User.fromJson(Map<String, dynamic> json) =>\n'
                '      _\$UserFromJson(json);\n'
                '  Map<String, dynamic> toJson() => _\$UserToJson(this);\n'
                '}',
                style: TextStyle(fontSize: 11, fontFamily: 'monospace'),
              ),
            ),
            const SizedBox(height: 6),
            const Text('运行: flutter pub run build_runner build', style: TextStyle(fontSize: 11, color: Colors.blue)),
          ]),
          _buildCard('解析示例', [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(4)),
              child: const Text(
                'String jsonStr = \'{"name":"wendux","age":25}\';\n'
                'Map<String, dynamic> json = jsonDecode(jsonStr);\n'
                'User user = User.fromJson(json);\n'
                'print(user.name); // wendux',
                style: TextStyle(color: Colors.green, fontSize: 11, fontFamily: 'monospace'),
              ),
            ),
          ]),
          _buildCard('依赖', [
            _buildTag('json_annotation'),
            _buildTag('json_serializable'),
            _buildTag('build_runner'),
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
