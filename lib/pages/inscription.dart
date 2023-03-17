// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:getwidget/getwidget.dart';
import 'package:image_network/image_network.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
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
  bool isAdmin = false;

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
                  "S'INSCRIRE",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
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
                GFCheckboxListTile(
                    titleText: "Administrateur ?",
                    color: Colors.white.withOpacity(0.9),
                    value: isAdmin,
                    onChanged: (v) {
                      setState(() {
                        isAdmin = v;
                      });
                    }),
                SizedBox(
                  height: 20,
                ),
                GFButtonBar(
                  children: [
                    GFButton(
                      size: 40,
                      onPressed: () {
                        var formValide = formKey.currentState!.validate();
                        if (formValide) {
                          clients.add(Client(
                            nom: nom.text,
                            email: email.text,
                            phone: phone.text,
                            mdp: mdp.text,
                            isAdmin: isAdmin,
                          ));
                          pushRemove(context, ConnexionPage());
                        }
                      },
                      text: "S'INSCRIRE",
                    ),
                    GFButton(
                      size: 40,
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
