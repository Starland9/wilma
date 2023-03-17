// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:image_network/image_network.dart';
import 'package:wilma/classes/car.dart';
import 'package:wilma/logic/nav.dart';
import 'package:wilma/main.dart';
import 'package:wilma/pages/index.dart';
import 'package:wilma/widgets/fields.dart';

class FromReparationPage extends StatefulWidget {
  const FromReparationPage({super.key, required this.car});

  final Car car;

  @override
  State<FromReparationPage> createState() => _FromReparationPageState();
}

class _FromReparationPageState extends State<FromReparationPage> {
  var dateRdv = TextEditingController();
  var comment = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 150),
        child: Column(
          children: [
            ImageNetwork(
              image: widget.car.carImagePath,
              height: 300,
              width: 300,
            ),
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  "Entrez les informations afin de nous permettre de comprendre votre demande.",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  gClient!.nom,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  gClient!.email,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: LSFormField(
                        controller: dateRdv,
                        hint: "Donnez la date de RDV",
                      ),
                    ),
                    GFIconButton(
                        icon: Icon(Icons.edit_calendar),
                        onPressed: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now()
                                    ..add(
                                      Duration(days: 90),
                                    ))
                              .then((value) {
                            if (value != null) {
                              dateRdv.text = value.toIso8601String();
                            }
                          });
                        })
                  ],
                ),
                GFTextFieldSquared(
                  minLines: 5,
                  maxLines: 6,
                  controller: comment,
                  editingbordercolor: Theme.of(context).primaryColor,
                  idlebordercolor: Colors.grey,
                  borderwidth: 0.5,
                  hintText: "Ecrivex un message descriptif ici...",
                ),
                GFButton(
                  onPressed: () {
                    GFToast.showToast(
                        "Votre message a bien ete envoye !", context);
                    pushRemove(
                        context,
                        IndexPage(
                          client: gClient,
                        ));
                  },
                  shape: GFButtonShape.square,
                  size: 45,
                  fullWidthButton: true,
                  text: "ENVOYER",
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
