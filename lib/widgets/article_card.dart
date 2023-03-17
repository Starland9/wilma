import 'package:flutter/material.dart';

import 'package:getwidget/getwidget.dart';
import 'package:image_network/image_network.dart';
import 'package:wilma/classes/article.dart';

class ArticleCard extends StatefulWidget {
  const ArticleCard({super.key, required this.article});
  final Article article;

  @override
  State<ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  @override
  Widget build(BuildContext context) {
    return GFCard(
      title: GFListTile(
        titleText: widget.article.nom,
        subTitleText: "${widget.article.prix} FCFA",
        description: Text(widget.article.description),
      ),
      content: ImageNetwork(
        image: widget.article.imagePath,
        height: 200,
        width: 200,
        fitWeb: BoxFitWeb.cover,
      ),
      buttonBar: GFButtonBar(children: [
        GFButton(
          onPressed: () {
            GFToast.showToast("Commande success !", context);
          },
          text: "COMMANDER",
          size: 36,
        ),
      ]),
    );
  }
}
