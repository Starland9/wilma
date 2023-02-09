// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:getwidget/getwidget.dart';
import 'package:wilma/classes/client.dart';
import 'package:wilma/logic/nav.dart';

import '../widgets/fields.dart';
import 'connexion.dart';

class InscriptionPage extends StatefulWidget {
  const InscriptionPage({super.key});

  @override
  State<InscriptionPage> createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  TextEditingController nom = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController mdp = TextEditingController();
  TextEditingController cMdp = TextEditingController();

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
                  "S'INSCRIRE",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(
                  height: 70,
                ),
                LSFormField(
                  controller: nom,
                  hint: "Nom",
                  type: GfFormFieldType.name,
                ),
                LSFormField(
                  controller: email,
                  hint: "Adresse email",
                  type: GfFormFieldType.email,
                ),
                LSFormField(
                  controller: phone,
                  hint: "Numero de téléphone",
                  type: GfFormFieldType.phone,
                ),
                LSFormField(
                  controller: mdp,
                  hint: "Mot de passe",
                  type: GfFormFieldType.password,
                ),
                LSFormField(
                  controller: cMdp,
                  hint: "Confirmation du Mot de passe",
                  type: GfFormFieldType.password,
                ),
                GFButtonBar(
                  children: [
                    GFButton(
                      onPressed: () {
                        var formValide = formKey.currentState!.validate();
                        if (formValide) {
                          clients.add(Client(
                            nom: nom.text,
                            email: email.text,
                            phone: phone.text,
                            mdp: mdp.text,
                          ));
                          pushRemove(context, ConnexionPage());
                        }
                      },
                      text: "S'INSCRIRE",
                    ),
                    GFButton(
                      onPressed: () {
                        pushRemove(context, ConnexionPage());
                      },
                      text: "J'AI DEJA UN COMPTE",
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
