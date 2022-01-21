import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CounterII extends StatefulWidget {
  const CounterII({Key? key, required this.storage}) : super(key: key);

  final CounterData storage;

  @override
  _CounterIIState createState() => _CounterIIState();
}

class _CounterIIState extends State<CounterII> {
  int _counter = 0;
  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              //widget. counterII();
              setState(() {
                _incrementCounterPP();
              });
            },
            child: const Text('II counter')),
        const SizedBox(
          width: 20,
        ),
        Text('$_counter')
      ],
    );
  }

  Future<File> _incrementCounterPP() {
    setState(() {
      _counter++;
    });
    return widget.storage.writeCounter(_counter);
  }
}

class CounterData {
  Future<String> get _localPath async {
    //запросили путь к папке
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    print('write  $_localPath.');
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;
      final contens = await file.readAsString();
      return int.parse(contens);
    } catch (e) {
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;
    print(' write counter 2');
    return file.writeAsString('$counter');
  }
}
