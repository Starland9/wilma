// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'admin.dart';
import 'admin_articles.dart';
import 'admin_client.dart';

class AdminGlobalPage extends StatefulWidget {
  const AdminGlobalPage({super.key});

  @override
  State<AdminGlobalPage> createState() => _AdminGlobalPageState();
}

class _AdminGlobalPageState extends State<AdminGlobalPage> {
  List<Widget> pages = [
    AdminPage(),
    AdminArticlesPage(),
    AdminClient(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: pages.length,
      child: Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_literals_to_create_immutables
          bottom: TabBar(tabs: [
            GFListTile(
              titleText: "Voitures",
            ),
            GFListTile(
              titleText: "Pièces",
            ),
            GFListTile(
              titleText: "Clients",
            ),
          ]),
        ),
        body: TabBarView(children: pages),
      ),
    );
  }
}
