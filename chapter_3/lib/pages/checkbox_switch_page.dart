import 'package:flutter/material.dart';

class CheckboxSwitchPage extends StatefulWidget {
  const CheckboxSwitchPage({super.key});

  @override
  State<CheckboxSwitchPage> createState() => _CheckboxSwitchPageState();
}

class _CheckboxSwitchPageState extends State<CheckboxSwitchPage> {
  bool _isChecked1 = false;
  bool _isChecked2 = true;
  bool _isSwitched1 = false;
  bool _isSwitched2 = true;
  String? _selectedRadio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3.4 单选开关和复选框'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Checkbox（复选框）'),
            const SizedBox(height: 16),
            _buildCard(
              title: '基础复选框',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _isChecked1,
                        onChanged: (value) {
                          setState(() {
                            _isChecked1 = value ?? false;
                          });
                        },
                      ),
                      const Text('选项1'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _isChecked2,
                        onChanged: (value) {
                          setState(() {
                            _isChecked2 = value ?? false;
                          });
                        },
                      ),
                      const Text('选项2'),
                    ],
                  ),
                ],
              ),
            ),
            _buildCard(
              title: '自定义复选框颜色',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _isChecked1,
                        onChanged: (value) {
                          setState(() {
                            _isChecked1 = value ?? false;
                          });
                        },
                        activeColor: Colors.red,
                        checkColor: Colors.white,
                      ),
                      const Text('红色'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _isChecked2,
                        onChanged: (value) {
                          setState(() {
                            _isChecked2 = value ?? false;
                          });
                        },
                        activeColor: Colors.green,
                        checkColor: Colors.white,
                      ),
                      const Text('绿色'),
                    ],
                  ),
                ],
              ),
            ),
            _buildCard(
              title: 'CheckboxListTile',
              child: Column(
                children: [
                  CheckboxListTile(
                    title: const Text('选项A'),
                    value: _isChecked1,
                    onChanged: (value) {
                      setState(() {
                        _isChecked1 = value ?? false;
                      });
                    },
                    subtitle: const Text('这是选项A的描述'),
                  ),
                  CheckboxListTile(
                    title: const Text('选项B'),
                    value: _isChecked2,
                    onChanged: (value) {
                      setState(() {
                        _isChecked2 = value ?? false;
                      });
                    },
                    subtitle: const Text('这是选项B的描述'),
                    secondary: const Icon(Icons.check_circle),
                  ),
                ],
              ),
            ),
            _buildSectionTitle('Switch（开关）'),
            const SizedBox(height: 16),
            _buildCard(
              title: '基础开关',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Text('开关1'),
                      Switch(
                        value: _isSwitched1,
                        onChanged: (value) {
                          setState(() {
                            _isSwitched1 = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('开关2'),
                      Switch(
                        value: _isSwitched2,
                        onChanged: (value) {
                          setState(() {
                            _isSwitched2 = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _buildCard(
              title: '自定义开关颜色',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Switch(
                    value: _isSwitched1,
                    onChanged: (value) {
                      setState(() {
                        _isSwitched1 = value;
                      });
                    },
                    activeColor: Colors.orange,
                    activeTrackColor: Colors.orange[200],
                  ),
                  Switch(
                    value: _isSwitched2,
                    onChanged: (value) {
                      setState(() {
                        _isSwitched2 = value;
                      });
                    },
                    activeColor: Colors.purple,
                    activeTrackColor: Colors.purple[200],
                  ),
                ],
              ),
            ),
            _buildCard(
              title: 'SwitchListTile',
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text('通知开关'),
                    value: _isSwitched1,
                    onChanged: (value) {
                      setState(() {
                        _isSwitched1 = value;
                      });
                    },
                    subtitle: const Text('开启/关闭通知'),
                  ),
                  SwitchListTile(
                    title: const Text('深色模式'),
                    value: _isSwitched2,
                    onChanged: (value) {
                      setState(() {
                        _isSwitched2 = value;
                      });
                    },
                    subtitle: const Text('开启/关闭深色模式'),
                    secondary: const Icon(Icons.dark_mode),
                  ),
                ],
              ),
            ),
            _buildSectionTitle('Radio（单选框）'),
            const SizedBox(height: 16),
            _buildCard(
              title: '基础单选框',
              child: Column(
                children: [
                  ListTile(
                    title: const Text('选项1'),
                    leading: Radio(
                      value: 'option1',
                      groupValue: _selectedRadio,
                      onChanged: (value) {
                        setState(() {
                          _selectedRadio = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('选项2'),
                    leading: Radio(
                      value: 'option2',
                      groupValue: _selectedRadio,
                      onChanged: (value) {
                        setState(() {
                          _selectedRadio = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('选项3'),
                    leading: Radio(
                      value: 'option3',
                      groupValue: _selectedRadio,
                      onChanged: (value) {
                        setState(() {
                          _selectedRadio = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            _buildCard(
              title: 'RadioListTile',
              child: Column(
                children: [
                  RadioListTile(
                    title: const Text('苹果'),
                    value: 'apple',
                    groupValue: _selectedRadio,
                    onChanged: (value) {
                      setState(() {
                        _selectedRadio = value;
                      });
                    },
                    secondary: const Icon(Icons.apple),
                  ),
                  RadioListTile(
                    title: const Text('香蕉'),
                    value: 'banana',
                    groupValue: _selectedRadio,
                    onChanged: (value) {
                      setState(() {
                        _selectedRadio = value;
                      });
                    },
                    secondary: const Icon(Icons.star),
                  ),
                ],
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
        color: Colors.orange,
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