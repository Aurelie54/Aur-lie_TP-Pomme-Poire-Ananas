import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomme, Poire et Ananas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Pomme, Poire et Ananas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final List<int> _items = [];

  bool _isPrime(int number) {
    if (number <= 1) {
      return false;
    }

    for (int i = 2; i <= sqrt(number); i++) {
      if (number % i == 0) {
        return false;
      }
    }

    return true;

  }

    Widget _getItemImage(int value) {
    if (_isPrime(value)) {
      return Image.asset('assets/images/ananas.png',
      width: 48,
      height: 48,);
    } else if (value.isEven) {
      return Image.asset('assets/images/pomme.png',
      width: 48,
      height: 48,);
    } else {
      return Image.asset('assets/images/poire.png',
      width: 48,
      height: 48,);
    }
  }

  String _getItemType(int value) {
    if (_isPrime(value)) {
      return 'nombre premier';
    } else if (value.isEven) {
      return 'pair';
    } else {
      return 'impair';
    }
  }

  Color _getItemColor(int value) {
    if (_isPrime(value)) {
      return Colors.indigo;
    } else {
      return Colors.cyan;
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _items.add(_counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_counter (${_getItemType(_counter)})'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            final value = _items[index];

            return Container(
              color: _getItemColor(value),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _getItemImage(value),
                  ),
                  Text(
                    '$value',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}