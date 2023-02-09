// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../classes/article.dart';
import './fields.dart';
import 'package:getwidget/getwidget.dart';
import '../classes/car.dart';

class AddCarDialog extends StatefulWidget {
  const AddCarDialog({super.key, this.k});

  final int? k;

  @override
  State<AddCarDialog> createState() => _AddCarDialogState();
}

class _AddCarDialogState extends State<AddCarDialog> {
  TextEditingController model = TextEditingController();
  TextEditingController image = TextEditingController();
  TextEditingController logo = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    if (widget.k != null) {
      model.text = cars.get(widget.k)!.model;
      image.text = cars.get(widget.k)!.carImagePath;
      logo.text = cars.get(widget.k)!.carModelLogoPath;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("Ajouter une voiture"),
      children: [
        Container(
          padding: EdgeInsets.all(15),
          width: 600,
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                LSFormField(
                  controller: model,
                  hint: "Le model de la voiture",
                  type: GfFormFieldType.name,
                ),
                LSFormField(
                  controller: image,
                  hint: "L'image de la voiture",
                ),
                LSFormField(
                  controller: logo,
                  hint: "Le logo de la voiture",
                ),
                GFButtonBar(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    GFButton(
                      onPressed: () {
                        bool formValide = formKey.currentState!.validate();
                        if (formValide) {
                          if (widget.k != null) {
                            var car = cars.get(widget.k)!;
                            car.model = model.text;
                            car.carImagePath = image.text;
                            car.carModelLogoPath = logo.text;
                            car.save();
                          } else {
                            cars.add(Car(
                              model: model.text,
                              carImagePath: image.text,
                              carModelLogoPath: logo.text,
                            ));
                          }

                          Navigator.of(context).pop();
                        }
                      },
                      text: "ENREGISTRER",
                    ),
                    GFButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      text: "ANNULER",
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

// #######################################################

class DialogAddArticle extends StatefulWidget {
  const DialogAddArticle({super.key, this.k});

  final Article? k;

  @override
  State<DialogAddArticle> createState() => _DialogAddArticleState();
}

class _DialogAddArticleState extends State<DialogAddArticle> {
  TextEditingController nom = TextEditingController();
  TextEditingController prix = TextEditingController();
  TextEditingController image = TextEditingController();
  TextEditingController description = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    if (widget.k != null) {
      var article = articles.get(widget.k)!;
      nom.text = article.nom;
      image.text = article.imagePath;
      prix.text = article.prix.toString();
      description.text = article.description;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("Ajouter une nouvelle pièce de voiture"),
      children: [
        Container(
          padding: EdgeInsets.all(15),
          width: 600,
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                LSFormField(
                  controller: nom,
                  hint: "Le nom de la pièce",
                  type: GfFormFieldType.name,
                ),
                LSFormField(
                  controller: image,
                  hint: "L'image de la pièce",
                ),
                LSFormField(
                  controller: prix,
                  hint: "Le prix de la pièce",
                  type: GfFormFieldType.number,
                ),
                GfFormField(
                    gfFormFieldType: GfFormFieldType.text,
                    editingbordercolor: Colors.black,
                    idlebordercolor: Colors.black,
                    borderwidth: 2,
                    hintText: "Une petite description",
                    minLines: 2,
                    maxLines: 3,
                    ),
                GFButtonBar(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    GFButton(
                      onPressed: () {
                        bool formValide = formKey.currentState!.validate();
                        if (formValide) {
                          if (widget.k != null) {
                            var article = articles.get(widget.k)!;
                            article.nom = nom.text;
                            article.description = description.text;
                            article.imagePath = image.text;
                            article.prix = double.parse(prix.text);
                          } else {
                            articles.add(Article(nom: nom.text, description: description.text, prix: double.parse(prix.text), imagePath: image.text));
                          }

                          Navigator.of(context).pop();
                        }
                      },
                      text: "ENREGISTRER",
                    ),
                    GFButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      text: "ANNULER",
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
    
  }
}
