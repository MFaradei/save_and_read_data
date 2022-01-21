import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterI extends StatefulWidget {
  const CounterI({Key? key}) : super(key: key);

  @override
  _CounterIState createState() => _CounterIState();
}

class _CounterIState extends State<CounterI> {
  late SharedPreferences _prefs;
  int counter1 = 0;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance()
      ..then((prefs) {
        setState(() => this._prefs = prefs);
        _readData();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              counterI();
              setState(() {});
            },
            child: const Text('I counter')),
        const SizedBox(
          width: 20,
        ),
        Text('$counter1'),
      ],
    );
  }

  void counterI() async {
    counter1 = (counter1) + 1;
    print("counter 1 = $counter1");
    _prefs.setInt('counter 1', counter1);
  }

  void _readData() {
    setState(() {
      counter1 = _prefs.getInt('counter 1') ?? 0;
    });
  }
}
