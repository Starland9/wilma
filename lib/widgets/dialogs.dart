// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  GlobalKey<FormState> formKey = GlobalKey();
  String? image;
  String? logo;

  @override
  void initState() {
    if (widget.k != null) {
      model.text = cars.get(widget.k)!.model;
      image = cars.get(widget.k)!.carImagePath;
      logo = cars.get(widget.k)!.carModelLogoPath;
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
                GFListTile(
                  avatar: image != null
                      ? Image.network(
                          image!,
                          width: 100,
                        )
                      : null,
                  titleText: "Choisir l'image",
                  icon: GFIconButton(
                      icon: Icon(Icons.image_search),
                      onPressed: () {
                        // ignore: invalid_use_of_visible_for_testing_member
                        ImagePicker.platform
                            .getImageFromSource(
                          source: ImageSource.gallery,
                        )
                            .then((value) {
                          setState(() {
                            image = value?.path;
                          });
                        });
                      }),
                ),
                GFListTile(
                  avatar: logo != null
                      ? Image.network(
                          logo!,
                          width: 100,
                        )
                      : null,
                  titleText: "Choisir le logo",
                  icon: GFIconButton(
                      icon: Icon(Icons.image_search),
                      onPressed: () {
                        // ignore: invalid_use_of_visible_for_testing_member
                        ImagePicker.platform
                            .getImageFromSource(
                          source: ImageSource.gallery,
                        )
                            .then((value) {
                          setState(() {
                            logo = value?.path;
                          });
                        });
                      }),
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
                            car.carImagePath =
                                image ?? "images/vehicules/acura.png";
                            car.carModelLogoPath =
                                logo ?? "images/vehicules/acura.png";
                            car.save();
                          } else {
                            cars.add(Car(
                              model: model.text,
                              carImagePath:
                                  image ?? "images/vehicules/acura.png",
                              carModelLogoPath:
                                  logo ?? "images/vehicules/acura.png",
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
  TextEditingController description = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  String? image;

  @override
  void initState() {
    if (widget.k != null) {
      var article = articles.get(widget.k)!;
      nom.text = article.nom;
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
                GFListTile(
                  avatar: image != null
                      ? Image.network(
                          image!,
                          width: 100,
                        )
                      : null,
                  titleText: "Choisir l'image",
                  icon: GFIconButton(
                      icon: Icon(Icons.image_search),
                      onPressed: () {
                        // ignore: invalid_use_of_visible_for_testing_member
                        ImagePicker.platform
                            .getImageFromSource(
                          source: ImageSource.gallery,
                        )
                            .then((value) {
                          setState(() {
                            image = value?.path;
                          });
                        });
                      }),
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
                            article.imagePath =
                                image ?? "images/logo/logo-acura.png";
                            article.prix = double.parse(prix.text);
                          } else {
                            articles.add(Article(
                                nom: nom.text,
                                description: description.text,
                                prix: double.parse(prix.text),
                                imagePath:
                                    image ?? "images/logo/logo-acura.png"));
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
