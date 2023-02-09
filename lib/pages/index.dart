// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import '../classes/client.dart';
import '../logic/nav.dart';
import 'admin_global.dart';
import 'choix_model.dart';
import 'choix_reparation.dart';
import 'connexion.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key, this.client});

  final Client? client;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WILMA AUTO"),
        actions: [
          if (client == null)
            GFButton(
              onPressed: () {
                pushRemove(context, ConnexionPage());
              },
              text: "SE CONNECTER",
            ),
          if (client != null &&
              (client!.email.contains("landry") ||
                  client!.email.contains("wilma")))
            GFButton(
              onPressed: () {
                push(context, AdminGlobalPage());
              },
              text: "ADMIN",
            ),
          if (client != null)
            GFButton(
              onPressed: () {
                pushRemove(context, ConnexionPage());
              },
              text: "DECONNEXION",
              color: Colors.red,
            ),
        ],
      ),
      body: Center(
        child: GFButtonBar(children: [
          GFButton(
            onPressed: () {
              push(context, ChoixModelPage());
            },
            text: "REPARATION DE VOITURE",
          ),
          GFButton(
            onPressed: () {
              push(context, ChoixReparation());
            },
            text: "ACHAT DE PIECES DE VOITURE",
          ),
        ]),
      ),
    );
  }
}
