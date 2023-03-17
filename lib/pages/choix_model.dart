// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';
import 'package:wilma/logic/nav.dart';
import 'package:wilma/pages/form_rep.dart';

import '../classes/car.dart';

class ChoixModelPage extends StatefulWidget {
  const ChoixModelPage({super.key});

  @override
  State<ChoixModelPage> createState() => _ChoixModelPageState();
}

class _ChoixModelPageState extends State<ChoixModelPage> {
  double elevation = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: Text("Choisis ton model de voiture"),
        searchBar: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: cars.values
                  .map((e) => InkWell(
                        onTap: () {
                          push(context, FromReparationPage(car: e));
                        },
                        onFocusChange: (e) {
                          setState(() {
                            if (e) {
                              elevation = 15;
                            } else {
                              elevation = 5;
                            }
                          });
                        },
                        child: Card(
                          elevation: elevation,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: CachedNetworkImage(
                              imageUrl: e.carModelLogoPath,
                              width: 250,
                              filterQuality: FilterQuality.medium,
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
