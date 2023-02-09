// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../classes/article.dart';
import '../widgets/dialogs.dart';

class AdminArticlesPage extends StatefulWidget {
  const AdminArticlesPage({super.key});

  @override
  State<AdminArticlesPage> createState() => _AdminArticlesPageState();
}

class _AdminArticlesPageState extends State<AdminArticlesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ignore: prefer_const_literals_to_create_immutables
            DataTable(
              // headingRowHeight: 300,
              // ignore: prefer_const_literals_to_create_immutables
              columns: [
                DataColumn(label: Text("N°")),
                DataColumn(label: Text("IMAGE")),
                DataColumn(label: Text("NOM")),
                DataColumn(label: Text("PRIX")),
                DataColumn(label: Text("DESCRIPTION")),
                DataColumn(label: Text("MODIFIER")),
                DataColumn(label: Text("SUPPRIMER")),
              ],
              rows: articles.values
                  .map((e) => DataRow(cells: [
                        DataCell(Text((e.key + 1).toString())),
                        DataCell(
                          Image.asset(
                            "images/icons/icon-carosserie.png",
                            filterQuality: FilterQuality.medium,
                            // width: 300,
                            // scale: 0.5,
                          ),
                        ),
                        DataCell(Text(e.nom)),
                        DataCell(Text("${e.prix} FCFA")),
                        DataCell(Text(e.description)),
                        DataCell(
                          GFIconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return DialogAddArticle(k: e,);
                                },
                              ).then((value) {
                                setState(() {});
                              });
                            },
                            color: Colors.green,
                          ),
                        ),
                        DataCell(
                          GFIconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                articles.delete(e.key);
                              });
                            },
                            color: Colors.red,
                          ),
                        ),
                      ]))
                  .toList(),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return DialogAddArticle();
            },
          ).then((value) {
            setState(() {});
          });
        },
        label: Text(
          "Ajouter une nouvelle piece de voiture",
        ),
      ),
    );
    
  }
}
