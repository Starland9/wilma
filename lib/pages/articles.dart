// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:wilma/classes/article.dart';
import 'package:wilma/widgets/article_card.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  // ignore: unused_field
  List<Article> _articles = [];

  String search = "";
  @override
  void initState() {
    _updateArticles();
    super.initState();
  }

  void _updateArticles() {
    if (search.isEmpty) {
      _articles = articles.values.toList();
    } else {
      _articles = articles.values
          .where((element) => element.nom.contains(search))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      appBar: GFAppBar(
        searchBar: true,
        title: Text("Nos Articles"),
        actions: [
          SizedBox(
            width: 300,
            child: Padding(
              padding: EdgeInsets.all(1),
              child: GFTextFieldSquared(
                color: Colors.white,
                editingbordercolor: Theme.of(context).primaryColor,
                idlebordercolor: Colors.grey,
                borderwidth: 0.5,
                hintText: "Rechercher...",
                backgroundcolor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    search = value;
                    _updateArticles();
                  });
                },
              ),
            ),
          ),
        ],
      ),
      gradient: LinearGradient(
        colors: [
          Colors.orange.shade200,
          Colors.amber.shade300,
        ],
      ),
      body: GridView.extent(
        maxCrossAxisExtent: 600,
        children: _articles.map((e) => ArticleCard(article: e)).toList(),
      ),
    );
  }
}
