import 'package:flutter/material.dart';
import 'package:save_and_read_data/counter.dart';
import 'package:save_and_read_data/pages_authorization.dart';
import 'package:save_and_read_data/registration.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  //final prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Сохранение и загрузка данных',
        initialRoute: '/',
        routes: {
          '/': (context) => Pagesauthorization(),
          '/ registration': (context) => const Registration(),
          '/ counter': (context) => const Counter(),
        });
  }
}
