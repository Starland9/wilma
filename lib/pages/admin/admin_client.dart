// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../../classes/client.dart';


class AdminClient extends StatefulWidget {
  const AdminClient({super.key});

  @override
  State<AdminClient> createState() => _AdminClientState();
}

class _AdminClientState extends State<AdminClient> {
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
                DataColumn(label: Text("NOM")),
                DataColumn(label: Text("EMAIL")),
                DataColumn(label: Text("PHONE")),
                DataColumn(label: Text("MOT DE PASSE")),
                DataColumn(label: Text("SUPPRIMER")),
              ],
              rows: clients.values
                  .map((e) => DataRow(cells: [
                        DataCell(Text((e.key + 1).toString())),
                        DataCell(
                         Text(e.nom),
                        ),
                        DataCell(Text(e.email)),
                        DataCell(Text(e.phone)),
                        DataCell(Text(e.mdp)),
                  
                        DataCell(
                          GFIconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                clients.delete(e.key);
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
     
    );
  }
}
