import 'package:flutter/material.dart';

class StackLayoutPage extends StatelessWidget {
  const StackLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('4.6 层叠布局'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Stack 层叠'),
            const SizedBox(height: 8),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Stack(
                          children: [
                            Container(width: double.infinity, height: 84, color: Colors.blue[200]),
                            const Center(child: Text('居中')),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(width: double.infinity, height: 84, color: Colors.green[200]),
                            const Text('右下角'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _buildSectionTitle('Positioned 定位'),
            const SizedBox(height: 8),
            SizedBox(
              height: 100,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Stack(
                    children: [
                      Container(width: double.infinity, height: 84, color: Colors.grey[200]),
                      const Positioned(top: 10, left: 10, child: Text('左上')),
                      const Positioned(top: 10, right: 10, child: Text('右上')),
                      const Positioned(bottom: 10, left: 10, child: Text('左下')),
                      const Positioned(bottom: 10, right: 10, child: Text('右下')),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            _buildSectionTitle('实际应用'),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Stack(
                        children: [
                          Container(width: 100, height: 80, color: Colors.blue),
                          const Positioned(
                            top: -5,
                            right: -5,
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 14,
                              child: Text('5', style: TextStyle(color: Colors.white, fontSize: 11)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Stack(
                        children: [
                          Container(width: double.infinity, height: 80, color: Colors.blue),
                          Container(
                            width: double.infinity,
                            height: 80,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.transparent, Colors.black54],
                              ),
                            ),
                          ),
                          const Positioned(bottom: 8, left: 8, child: Text('底部文字', style: TextStyle(color: Colors.white))),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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
}