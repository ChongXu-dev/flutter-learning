import 'package:flutter/material.dart';

class LinearLayoutPage extends StatelessWidget {
  const LinearLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('4.3 线性布局'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Row 水平布局'),
            const SizedBox(height: 8),
            _buildLayoutCard('spaceBetween', Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 50, height: 40, color: Colors.red),
                Container(width: 50, height: 40, color: Colors.green),
                Container(width: 50, height: 40, color: Colors.blue),
              ],
            )),
            _buildLayoutCard('spaceAround', Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(width: 50, height: 40, color: Colors.red),
                Container(width: 50, height: 40, color: Colors.green),
                Container(width: 50, height: 40, color: Colors.blue),
              ],
            )),
            const SizedBox(height: 12),
            _buildSectionTitle('Column 垂直布局'),
            const SizedBox(height: 8),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: _buildLayoutCard('start', Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(width: 60, height: 30, color: Colors.red),
                        Container(width: 60, height: 30, color: Colors.green),
                      ],
                    )),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildLayoutCard('center', Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(width: 60, height: 30, color: Colors.red),
                        Container(width: 60, height: 30, color: Colors.green),
                      ],
                    )),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _buildSectionTitle('Row嵌套Column'),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(width: 50, height: 40, color: Colors.red),
                        Container(width: 50, height: 40, color: Colors.pink),
                      ],
                    ),
                    Column(
                      children: [
                        Container(width: 50, height: 40, color: Colors.green),
                        Container(width: 50, height: 40, color: Colors.lightGreen),
                      ],
                    ),
                  ],
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

  Widget _buildLayoutCard(String title, Widget child) {
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