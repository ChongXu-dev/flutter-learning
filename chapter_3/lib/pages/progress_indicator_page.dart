import 'package:flutter/material.dart';

class ProgressIndicatorPage extends StatefulWidget {
  const ProgressIndicatorPage({super.key});

  @override
  State<ProgressIndicatorPage> createState() => _ProgressIndicatorPageState();
}

class _ProgressIndicatorPageState extends State<ProgressIndicatorPage> {
  double _progress = 0.0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _startProgress();
  }

  void _startProgress() {
    _progress = 0.0;
    Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        _progress += 0.01;
      });
      return _progress < 1.0;
    });
  }

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3.6 进度指示器'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('LinearProgressIndicator（线性进度条）'),
            const SizedBox(height: 16),
            _buildCard(
              title: '不确定进度',
              child: const LinearProgressIndicator(),
            ),
            _buildCard(
              title: '确定进度（50%）',
              child: const LinearProgressIndicator(value: 0.5),
            ),
            _buildCard(
              title: '动态进度',
              child: Column(
                children: [
                  LinearProgressIndicator(value: _progress),
                  const SizedBox(height: 8),
                  Text('进度: ${(_progress * 100).toStringAsFixed(0)}%'),
                ],
              ),
            ),
            _buildCard(
              title: '自定义颜色',
              child: const LinearProgressIndicator(
                value: 0.7,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
            _buildSectionTitle('CircularProgressIndicator（圆形进度条）'),
            const SizedBox(height: 16),
            _buildCard(
              title: '不确定进度',
              child: const Center(child: CircularProgressIndicator()),
            ),
            _buildCard(
              title: '确定进度（75%）',
              child: const Center(
                child: CircularProgressIndicator(value: 0.75),
              ),
            ),
            _buildCard(
              title: '自定义大小和颜色',
              child: Center(
                child: CircularProgressIndicator(
                  value: 0.6,
                  backgroundColor: Colors.grey[200],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                  strokeWidth: 8,
                ),
              ),
            ),
            _buildCard(
              title: '不同大小的圆形进度条',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CircularProgressIndicator(
                    value: 0.5,
                    strokeWidth: 4,
                  ),
                  CircularProgressIndicator(
                    value: 0.5,
                    strokeWidth: 6,
                  ),
                  CircularProgressIndicator(
                    value: 0.5,
                    strokeWidth: 8,
                  ),
                ],
              ),
            ),
            _buildSectionTitle('实际应用示例'),
            const SizedBox(height: 16),
            _buildCard(
              title: '按钮加载状态',
              child: ElevatedButton(
                onPressed: _toggleLoading,
                child: _isLoading
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                          SizedBox(width: 8),
                          Text('加载中...'),
                        ],
                      )
                    : const Text('点击加载'),
              ),
            ),
            _buildCard(
              title: '带进度的按钮',
              child: ElevatedButton(
                onPressed: () => _startProgress(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('下载'),
                    const SizedBox(width: 8),
                    CircularProgressIndicator(
                      value: _progress,
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  ],
                ),
              ),
            ),
            _buildCard(
              title: '进度对话框',
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return const AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 16),
                            Text('正在处理...'),
                          ],
                        ),
                      );
                    },
                  );
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.pop(context);
                  });
                },
                child: const Text('显示进度对话框'),
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
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.teal,
      ),
    );
  }

  Widget _buildCard({required String title, required Widget child}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}