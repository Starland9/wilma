// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:wilma/classes/client.dart';
import 'package:wilma/logic/nav.dart';
import 'package:wilma/main.dart';

import '../widgets/fields.dart';
import 'package:getwidget/getwidget.dart';

import 'index.dart';
import 'inscription.dart';

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  TextEditingController email = TextEditingController();
  TextEditingController mdp = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: LinearGradient(colors: const [Colors.orange, Colors.amber]),
      body: Center(
        child: SizedBox(
          width: 500,
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "SE CONNECTER",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 70,
                ),
                LSFormField(
                  controller: email,
                  hint: "Adresse email",
                  type: GfFormFieldType.email,
                ),
                LSFormField(
                  controller: mdp,
                  hint: "Mot de passe",
                  type: GfFormFieldType.password,
                ),
                SizedBox(
                  height: 20,
                ),
                GFButtonBar(
                  children: [
                    GFButton(
                      onPressed: () {
                        var formValide = formKey.currentState!.validate();
                        if (formValide) {
                          try {
                            var client = clients.values.firstWhere((c) =>
                                c.email == email.text && c.mdp == mdp.text);
                            gClient = client;
                            pushRemove(
                                context,
                                IndexPage(
                                  client: client,
                                ));
                          } catch (e) {
                            GFToast.showToast(
                              "Ce client n'existe pas",
                              context,
                              backgroundColor: Colors.red,
                            );
                          }
                        }
                      },
                      text: "SE CONNECTER",
                      size: 40,
                    ),
                    GFButton(
                      size: 40,
                      onPressed: () {
                        pushRemove(context, InscriptionPage());
                      },
                      text: "JE N'AI PAS DE COMPTE",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
