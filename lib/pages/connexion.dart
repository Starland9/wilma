// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
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

  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: FastCachedImage(
              url:
                  "https://img.freepik.com/free-photo/professional-female-auto-mechanic-is-fixing-broken-car-auto-workshop-near-window_613910-17132.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 50),
          Center(
            child: SizedBox(
              width: 500,
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FastCachedImage(
                      url:
                          "https://img.freepik.com/free-vector/security_24908-54383.jpg",
                      width: 100,
                    ),
                    Text(
                      "Se connecter",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(),
                      ),
                      validator: GfFormValidators().gettextvalidator(),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      obscureText: obscure,
                      controller: mdp,
                      decoration: InputDecoration(
                        hintText: "Mot de passe",
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscure = !obscure;
                            });
                          },
                          icon: Icon(obscure ? Icons.key_off : Icons.key),
                        ),
                      ),
                      validator: GfFormValidators().gettextvalidator(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GFButton(
                      fullWidthButton: true,
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
                      text: "Se connecter",
                      size: 55,
                    ),
                    SizedBox(height: 15),
                    GFButton(
                      fullWidthButton: true,
                      size: 55,
                      onPressed: () {
                        pushRemove(context, InscriptionPage());
                      },
                      text: "Je n'ai pas de compte",
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 50),
        ],
      ),
    );
  }
}
