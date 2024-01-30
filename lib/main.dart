import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class MyObject {
  int _value;
  MyObject(this._value);

  int get value => _value;

  set value(newValue) => _value = newValue;

  void increase() {
    _value++;
  }

  void decrease() {
    _value--;
  }

  int square() {
    return _value * _value;
  }
  num power(int exponent){
    return pow(_value , exponent);
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MyObject myObject = MyObject(0);
  int n = 0;
  num squaren() {
    return pow(myObject.value, n);
  }
  // Create an instance of MyObject

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text('Bui Manh Hung'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Giá trị hiện tại: ${myObject.value}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    myObject.decrease();
                    setState(() {});
                  },
                  icon: const Icon(Icons.remove),
                  label: const Text('Giảm'),
                ),
                const SizedBox(width: 5),
                OutlinedButton.icon(
                  onPressed: () {
                    myObject.increase();
                    setState(() {});
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Tăng'),
                ),
              ],
            ),
            Text('Lũy thừa bậc 2 là: ${myObject.square()}'),
            Text('Lũy thừa bậc 5 là: ${myObject.power(5)}'),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Nhập số nguyên n'),
                onChanged: (value) {
                  n = int.parse(value);
                },
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {
                squaren();
                setState(() {});
              },
              icon: const Icon(Icons.add),
              label: const Text('Lũy thừa bậc n là:'),
            ),
            Text('${squaren()}', style: const TextStyle(fontSize: 32)),
          ],
        ),
      ),
    );
  }
}
