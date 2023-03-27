// ignore_for_file: prefer_const_constructors, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wilma/logic/nav.dart';
import 'package:wilma/main.dart';
import 'package:wilma/pages/admin/admin_global.dart';
import 'package:wilma/pages/articles.dart';
import 'package:wilma/pages/choix_model.dart';
import 'package:wilma/pages/connexion.dart';
import 'package:wilma/pages/profile/profil.dart';
import '../classes/client.dart';
import '../logic/auth.dart';

class IndexPage extends StatelessWidget {
  IndexPage({super.key, this.client});

  final Client? client;

  Map<String, dynamic> links = {
    // "Acceuil": null,
    // "A propos": null,
    // "Nos services": null,
    // "Contactez nous": null,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 500,
              child: Column(
                children: [
                  AppBar(
                    backgroundColor: Colors.amber,
                    title: Text(
                      "Wilma Auto",
                      style: GoogleFonts.aboreto(
                        fontSize: 22,
                        color: Colors.blue,
                      ),
                    ),
                    actions: [
                      if (gClient != null)
                        IconButton(
                            onPressed: () {
                              push(context, ProfilPage());
                            },
                            icon: Icon(
                              Icons.person_pin_circle_rounded,
                            )),
                      if (isAdmin())
                        IconButton(
                            onPressed: () {
                              push(context, AdminGlobalPage());
                            },
                            icon: Icon(Icons.admin_panel_settings))
                      else
                        GFButton(
                          onPressed: () {
                            pushRemove(context, ConnexionPage());
                          },
                          text: "CONNEXION",
                          size: 35,
                        ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset("images/vehicules/acura.png"),
                        Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            SizedBox(
                              width: 500,
                              child: Text(
                                "Nous vous offrons nos meilleurs services de reparation pas chers et avec confiance.",
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 50,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.amber.shade400,
              ),
            ),
            Divider(),
            Text(
              "Nos Services",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  width: 400,
                  height: 500,
                  child: GFCard(
                    title: GFListTile(
                      titleText: "REPARATION DE VOITURE",
                    ),
                    buttonBar: GFButtonBar(children: [
                      GFButton(
                        onPressed: () {
                          push(context, ChoixModelPage());
                        },
                        text: "ALLONS Y",
                        size: 40,
                        fullWidthButton: true,
                        shape: GFButtonShape.square,
                      ),
                    ]),
                    content: Image.asset("images/serv/rep.png"),
                  ),
                ),
                SizedBox(
                  width: 400,
                  height: 500,
                  child: GFCard(
                    title: GFListTile(
                      titleText: "VENTE DE PIECES DE RECHANGE",
                    ),
                    content: Image.asset("images/serv/mot.png"),
                    buttonBar: GFButtonBar(children: [
                      GFButton(
                        shape: GFButtonShape.square,
                        onPressed: () {
                          push(context, ArticlePage());
                        },
                        text: "ALLONS Y",
                        size: 40,
                        fullWidthButton: true,
                      ),
                    ]),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
