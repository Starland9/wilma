// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'classes/car.dart';
import 'classes/article.dart';
import 'classes/client.dart';
import 'pages/index.dart';

void main() async {
  var curDir = Directory.current.path;
  await Hive.initFlutter(curDir);
  Hive.registerAdapter(CarAdapter());
  Hive.registerAdapter(ArticleAdapter());
  Hive.registerAdapter(ClientAdapter());
  await Hive.openBox<Car>("cars");
  await Hive.openBox<Client>("clients");
  await Hive.openBox<Article>("articles");

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Client client = clients.values.first;

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: Colors.purple,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: IndexPage(
        client: client,
      ),
    );
  }
}
