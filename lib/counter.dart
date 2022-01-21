import 'package:flutter/material.dart';
import 'package:save_and_read_data/counter_i.dart';
import 'package:save_and_read_data/counter_ii.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CounterI(),
              Container(
                width: 20,
                color: Colors.white,
              ),
              CounterII(storage: CounterData()),
            ],
          ),
        ),
      ),
    );
  }
}
