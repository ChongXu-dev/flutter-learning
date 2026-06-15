import 'package:flutter/material.dart';

class InputFormPage extends StatefulWidget {
  const InputFormPage({super.key});

  @override
  State<InputFormPage> createState() => _InputFormPageState();
}

class _InputFormPageState extends State<InputFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('表单验证通过！')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3.5 输入框及表单'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('TextField（文本输入框）'),
            const SizedBox(height: 16),
            _buildCard(
              title: '基础输入框',
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '用户名',
                  hintText: '请输入用户名',
                ),
              ),
            ),
            _buildCard(
              title: '密码输入框',
              child: TextField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: '密码',
                  hintText: '请输入密码',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
              ),
            ),
            _buildCard(
              title: '带前缀图标的输入框',
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '邮箱',
                  hintText: '请输入邮箱',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ),
            _buildCard(
              title: '数字输入框',
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '年龄',
                  hintText: '请输入年龄',
                ),
              ),
            ),
            _buildCard(
              title: '多行文本输入',
              child: TextField(
                maxLines: 4,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '备注',
                  hintText: '请输入备注信息',
                ),
              ),
            ),
            _buildCard(
              title: '禁用状态',
              child: TextField(
                enabled: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '禁用输入框',
                  hintText: '此输入框已禁用',
                ),
              ),
            ),
            _buildSectionTitle('Form（表单）'),
            const SizedBox(height: 16),
            _buildCard(
              title: '完整表单示例',
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '邮箱',
                        hintText: '请输入邮箱地址',
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '请输入邮箱';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return '请输入有效的邮箱地址';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '密码',
                        hintText: '请输入密码',
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '请输入密码';
                        }
                        if (value.length < 6) {
                          return '密码长度至少6位';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '手机号',
                        hintText: '请输入手机号',
                        prefixIcon: Icon(Icons.phone),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '请输入手机号';
                        }
                        if (!RegExp(r'^1[3-9]\d{9}$').hasMatch(value)) {
                          return '请输入有效的手机号';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: const Text('提交'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48),
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
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.red,
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