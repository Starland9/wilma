// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../classes/car.dart';
import 'package:getwidget/getwidget.dart';

import '../widgets/dialogs.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
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
                DataColumn(label: Text("MODEL")),
                DataColumn(label: Text("MODIFIER")),
                DataColumn(label: Text("SUPPRIMER")),
              ],
              rows: cars.values
                  .map((e) => DataRow(cells: [
                        DataCell(Text((e.key + 1).toString())),
                        DataCell(
                          Image.asset(
                            "images/vehicules/${e.carImagePath}",
                            filterQuality: FilterQuality.medium,
                            width: 300,
                            // scale: 0.5,
                          ),
                        ),
                        DataCell(Text(e.model)),
                        DataCell(
                          GFIconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AddCarDialog(
                                    k: e.key,
                                  );
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
                                cars.delete(e.key);
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
              return AddCarDialog();
            },
          ).then((value) {
            setState(() {});
          });
        },
        label: Text(
          "Ajouter une voiture",
        ),
      ),
    );
  }
}
