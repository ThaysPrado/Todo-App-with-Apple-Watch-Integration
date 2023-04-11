import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import './ui/components/app_theme.dart';
import './pages/home_page.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('todoBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO List',
      debugShowCheckedModeBanner: false,
      theme: makeAppTheme(),
      home: const HomePage(title: 'TO DO List'),
    );
  }
}
