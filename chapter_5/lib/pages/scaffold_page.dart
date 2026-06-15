import 'package:flutter/material.dart';

class ScaffoldPage extends StatelessWidget {
  const ScaffoldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('5.7 页面骨架（Scaffold）'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Scaffold结构'),
            const SizedBox(height: 8),
            _buildCard(
              title: '基本结构',
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.blue[50],
                child: const Column(
                  children: [
                    SizedBox(height: 6),
                    Text('AppBar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                    SizedBox(height: 4),
                    Expanded(
                      child: Center(
                        child: Text('Body内容区域', style: TextStyle(fontSize: 12)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildSectionTitle('AppBar导航栏'),
            const SizedBox(height: 8),
            _buildCard(
              title: '带标题',
              child: const Center(child: Text('AppBar(title: Text(...))', style: TextStyle(fontSize: 12))),
            ),
            _buildCard(
              title: '带图标',
              child: const Center(child: Text('leading: Icon(Icons.menu)', style: TextStyle(fontSize: 12))),
            ),
            _buildSectionTitle('FloatingActionButton'),
            const SizedBox(height: 8),
            _buildCard(
              title: '基本浮动按钮',
              child: Container(
                width: double.infinity,
                height: 80,
                color: Colors.grey[100],
                child: const Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Center(child: Text('页面内容', style: TextStyle(fontSize: 12))),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: FloatingActionButton(
                        onPressed: null,
                        child: Icon(Icons.add, size: 20),
                        mini: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildCard(
              title: '不同位置',
              child: Container(
                width: double.infinity,
                height: 80,
                color: Colors.grey[100],
                child: const Stack(
                  children: [
                    Center(child: Text('不同位置', style: TextStyle(fontSize: 12))),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: FloatingActionButton(
                        onPressed: null,
                        backgroundColor: Colors.green,
                        child: Icon(Icons.home, size: 18),
                        mini: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildSectionTitle('BottomNavigationBar'),
            const SizedBox(height: 8),
            _buildCard(
              title: '底部导航',
              child: const Column(
                children: [
                  Text('底部导航示例', style: TextStyle(fontSize: 12)),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home, size: 20),
                      SizedBox(width: 30),
                      Icon(Icons.search, size: 20),
                      SizedBox(width: 30),
                      Icon(Icons.person, size: 20),
                    ],
                  ),
                ],
              ),
            ),
            _buildSectionTitle('Drawer侧边栏'),
            const SizedBox(height: 8),
            _buildCard(
              title: '侧边栏抽屉',
              child: Container(
                width: double.infinity,
                height: 80,
                color: Colors.grey[100],
                child: const Stack(
                  children: [
                    Center(child: Text('点击菜单打开侧边栏', style: TextStyle(fontSize: 12))),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Icon(Icons.menu, size: 24, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
            _buildSectionTitle('SnackBar消息提示'),
            const SizedBox(height: 8),
            _buildCard(
              title: '底部消息',
              child: Container(
                width: double.infinity,
                height: 60,
                color: Colors.grey[100],
                child: const Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Center(child: Text('操作后显示提示', style: TextStyle(fontSize: 12))),
                    Padding(
                      padding: EdgeInsets.all(4),
                      child: Material(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: Colors.black87,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.check, color: Colors.green, size: 16),
                              SizedBox(width: 6),
                              Text('操作成功！', style: TextStyle(color: Colors.white, fontSize: 12)),
                            ],
                          ),
                        ),
                      ),
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

  Widget _buildCard({required String title, required Widget child}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 6),
            child,
          ],
        ),
      ),
    );
  }
}