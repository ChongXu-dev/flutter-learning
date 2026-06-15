import 'package:flutter/material.dart';

class DartBasicsPage extends StatelessWidget {
  const DartBasicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dart语法基础'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('1. 变量声明'),
            _buildCodeCard(_codeVariables),
            const SizedBox(height: 20),
            _buildSectionTitle('2. 数据类型'),
            _buildCodeCard(_codeDataTypes),
            const SizedBox(height: 20),
            _buildSectionTitle('3. 函数'),
            _buildCodeCard(_codeFunctions),
            const SizedBox(height: 20),
            _buildSectionTitle('4. 控制流程'),
            _buildCodeCard(_codeControlFlow),
            const SizedBox(height: 20),
            _buildSectionTitle('5. 异步编程'),
            _buildCodeCard(_codeAsync),
            const SizedBox(height: 20),
            _buildSectionTitle('6. 类与对象'),
            _buildCodeCard(_codeClasses),
          ],
        ),
      ),
    );
  }

  final String _codeVariables = '''// var 声明变量，类型推断
var name = 'Flutter';
var age = 25;
var isStudent = true;

// final 和 const 声明常量
final pi = 3.14159;
const maxValue = 100;

// 显式类型声明
String username = '张三';
int count = 0;
double price = 99.9;
bool enabled = false;''';

  final String _codeDataTypes = '''// 数值类型
int intValue = 42;
double doubleValue = 3.14;

// 字符串
String str1 = '单引号';
String str2 = "双引号";
String str3 = """多行字符串""";

// 布尔值
bool flag = true;

// 列表(List)
List<String> fruits = ['苹果', '香蕉', '橙子'];
List<int> numbers = List.generate(5, (index) => index);

// 映射(Map)
Map<String, dynamic> person = {
  'name': '张三',
  'age': 25,
  'isStudent': true
};''';

  final String _codeFunctions = '''// 普通函数
int add(int a, int b) {
  return a + b;
}

// 箭头函数（单行函数）
int multiply(int a, int b) => a * b;

// 可选参数
void greet(String name, {String? greeting}) {
  print("\${greeting ?? 'Hello'}, \$name!");
}

// 默认参数
void introduce(String name, {int age = 18}) {
  print("My name is \$name, I'm \$age years old.");
}''';

  final String _codeControlFlow = '''// if-else
int score = 85;
if (score >= 90) {
  print('优秀');
} else if (score >= 60) {
  print('及格');
} else {
  print('不及格');
}

// for循环
for (int i = 0; i < 5; i++) {
  print(i);
}

// for-in循环
List<String> items = ['a', 'b', 'c'];
for (var item in items) {
  print(item);
}

// switch-case
String grade = 'A';
switch (grade) {
  case 'A':
    print('优秀');
    break;
  case 'B':
    print('良好');
    break;
  default:
    print('其他');
}''';

  final String _codeAsync = '''// Future 异步操作
Future<String> fetchData() async {
  await Future.delayed(const Duration(seconds: 1));
  return '数据加载完成';
}

// async-await
void getData() async {
  try {
    String result = await fetchData();
    print(result);
  } catch (e) {
    print('Error: \$e');
  }
}

// Stream 流式数据
Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}''';

  final String _codeClasses = '''class Person {
  // 属性
  String name;
  int age;
  
  // 构造函数
  Person(this.name, this.age);
  
  // 命名构造函数
  Person.anonymous() : name = '匿名', age = 0;
  
  // 方法
  void sayHello() {
    print("Hello, my name is \$name");
  }
  
  // Getter和Setter
  String get introduction => '\$name, \$age岁';
  
  set setAge(int newAge) {
    if (newAge > 0) age = newAge;
  }
}

// 使用类
var person = Person('张三', 25);
person.sayHello();
print(person.introduction);''';

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }

  Widget _buildCodeCard(String code) {
    return Card(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Color(0xfff8f9fa),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            code,
            style: const TextStyle(
              fontFamily: 'Monaco, Menlo, monospace',
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}