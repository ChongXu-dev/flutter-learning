import 'package:flutter/material.dart';

class FlexLayoutPage extends StatelessWidget {
  const FlexLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('4.4 弹性布局'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Flex 弹性布局'),
            const SizedBox(height: 8),
            _buildFlexCard('flex比例 1:2:1', Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(flex: 1, child: Container(height: 40, color: Colors.red)),
                Expanded(flex: 2, child: Container(height: 40, color: Colors.green)),
                Expanded(flex: 1, child: Container(height: 40, color: Colors.blue)),
              ],
            )),
            const SizedBox(height: 8),
            _buildFlexCard('flex比例 2:1', Row(
              children: [
                Expanded(flex: 2, child: Container(height: 40, color: Colors.red)),
                Expanded(flex: 1, child: Container(height: 40, color: Colors.blue)),
              ],
            )),
            const SizedBox(height: 12),
            _buildSectionTitle('Flexible vs Expanded'),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _buildFlexCard('Expanded', Row(
                    children: [
                      Expanded(flex: 1, child: Container(height: 40, color: Colors.red)),
                      Expanded(flex: 1, child: Container(height: 40, color: Colors.green)),
                    ],
                  )),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildFlexCard('Flexible', Row(
                    children: [
                      Flexible(flex: 1, child: Container(height: 40, color: Colors.red)),
                      Flexible(flex: 1, child: Container(height: 40, color: Colors.green)),
                    ],
                  )),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildSectionTitle('嵌套弹性布局'),
            const SizedBox(height: 8),
            SizedBox(
              height: 100,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(child: Container(color: Colors.red)),
                            Expanded(child: Container(color: Colors.orange)),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(child: Container(color: Colors.green)),
                            Expanded(flex: 2, child: Container(color: Colors.blue)),
                            Expanded(child: Container(color: Colors.purple)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }

  Widget _buildFlexCard(String title, Widget child) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            child,
          ],
        ),
      ),
    );
  }
}