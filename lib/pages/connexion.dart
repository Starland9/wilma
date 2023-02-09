// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wilma/classes/client.dart';
import 'package:wilma/logic/nav.dart';

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
    return Scaffold(
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
                  style: Theme.of(context).textTheme.headlineLarge,
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
                GFButtonBar(
                  children: [
                    GFButton(
                      onPressed: () {
                        var formValide = formKey.currentState!.validate();
                        if (formValide) {
                          try {
                            var client = clients.values.firstWhere((c) =>
                                c.email == email.text && c.mdp == mdp.text);
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
                    ),
                    GFButton(
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
