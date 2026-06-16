import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExtendedCounterPage extends StatefulWidget {
  const ExtendedCounterPage({super.key});

  @override
  State<ExtendedCounterPage> createState() => _ExtendedCounterPageState();
}

class _ExtendedCounterPageState extends State<ExtendedCounterPage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _readCounter();
  }

  Future<void> _readCounter() async {
    int value = await SharedPreferences.getInstance()
        .then((prefs) => prefs.getInt('counter') ?? 0);
    setState(() {
      _counter = value;
    });
  }

  Future<void> _incrementCounter() async {
    setState(() {
      _counter++;
    });
    await SharedPreferences.getInstance()
        .then((prefs) => prefs.setInt('counter', _counter));
  }

  Future<void> _resetCounter() async {
    setState(() {
      _counter = 0;
    });
    await SharedPreferences.getInstance()
        .then((prefs) => prefs.setInt('counter', 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('扩展功能：持久化计数器')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '点击按钮增加计数，返回主界面或关闭App再打开，数据不会丢失：',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _resetCounter,
                  child: const Text('重置'),
                ),
                const SizedBox(width: 16),
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Card(
              margin: EdgeInsets.symmetric(horizontal: 32),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  '💡 原理说明：\n计数器的值会实时写入本地存储（SharedPreferences），支持Web和移动端，即使关闭App后重新打开，也会从存储中读取上次保存的值。',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}