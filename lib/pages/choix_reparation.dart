// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import '../classes/genre_reparation.dart';

class ChoixReparation extends StatefulWidget {
  const ChoixReparation({super.key});

  @override
  State<ChoixReparation> createState() => _ChoixReparationState();
}

class _ChoixReparationState extends State<ChoixReparation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: Text("Quelle catégorie t'intéresse ?"),
        searchBar: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Wrap(
            runAlignment: WrapAlignment.center,
            children: genresReparations
                .map((e) => InkWell(
                      onTap: () {},
                      child: SizedBox(
                        width: 400,
                        child: GFCard(
                          elevation: 10,
                          title: GFListTile(
                            titleText: e.title,
                            description: Text("\n${e.description}"),
                            avatar: Image.asset(e.iconPath),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
