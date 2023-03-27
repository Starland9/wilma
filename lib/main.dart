// ignore_for_file: prefer_const_constructors

import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'classes/car.dart';
import 'classes/article.dart';
import 'classes/cart.dart';
import 'classes/client.dart';
import 'classes/order.dart';
import 'pages/index.dart';

Client? gClient;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // var curDir = Directory.current.path;
  // if (kIsWeb) {
  await Hive.initFlutter();
  // } else {
  //   await Hive.initFlutter("$curDir/db/");
  // }

  Hive.registerAdapter(CarAdapter());
  Hive.registerAdapter(ArticleAdapter());
  Hive.registerAdapter(ClientAdapter());
  Hive.registerAdapter(CartAdapter());
  Hive.registerAdapter(OrderAdapter());
  await Hive.openBox<Car>("cars");
  await Hive.openBox<Client>("clients");
  await Hive.openBox<Cart>("carts");
  await Hive.openBox<Order>("orders");
  await Hive.openBox<Article>("articles");
  await FastCachedImageConfig.init(clearCacheAfter: Duration(days: 1));

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (gClient == null && clients.isNotEmpty) {
      gClient = clients.values.first;
    }

    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.almaraiTextTheme(),
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: IndexPage(
        client: gClient,
      ),
    );
  }
}
