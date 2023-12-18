import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'home/home.view.dart';
import 'home/viewmodel/home.viewmodel.dart';

void main() {
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<HomeViewModel>(HomeViewModel());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flash Card App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}

