// ignore_for_file: prefer_const_constructors

import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:getwidget/getwidget.dart';
import 'package:wilma/classes/client.dart';
import 'package:wilma/logic/nav.dart';

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

  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: FastCachedImage(
              url:
                  "https://img.freepik.com/premium-vector/car-services-auto-garage-vector-marketing-banners_53562-4292.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 50),
          Center(
            child: SizedBox(
              width: 500,
              child: SingleChildScrollView(
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
                      SizedBox(height: 15),
                      Text(
                        "S'inscrire",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      TextFormField(
                        controller: nom,
                        decoration: InputDecoration(
                          hintText: "Nom d'utilisateur",
                          border: OutlineInputBorder(),
                        ),
                        validator: GfFormValidators().gettextvalidator(),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(),
                        ),
                        validator: GfFormValidators().gettextvalidator(),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: phone,
                        decoration: InputDecoration(
                          hintText: "Telephone",
                          border: OutlineInputBorder(),
                        ),
                        validator: GfFormValidators().gettextvalidator(),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: mdp,
                        obscureText: obscure,
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
                      SizedBox(height: 10),
                      TextFormField(
                        controller: cMdp,
                        obscureText: obscure,
                        decoration: InputDecoration(
                          hintText: "Confirmation",
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
                          _addClient(context);
                        },
                        text: "S'enregistrer",
                        size: 55,
                      ),
                      SizedBox(height: 15),
                      GFButton(
                        fullWidthButton: true,
                        size: 55,
                        onPressed: () {
                          pushRemove(context, ConnexionPage());
                        },
                        text: "J'ai deja un compte",
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 50),
        ],
      ),
    );
  }

  void _addClient(BuildContext context) {
    var formValide = formKey.currentState!.validate();
    if (mdp.text != cMdp.text || mdp.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Les mots de passes ne sont pas identiques"),
        ),
      );
      return;
    }
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
  }
}
