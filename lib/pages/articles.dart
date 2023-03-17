// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      appBar: GFAppBar(
        searchBar: true,
        title: Text("Nos Articles"),
      ),
      gradient: LinearGradient(
        colors: [
          Colors.orange.shade200,
          Colors.amber.shade300,
        ],
      ),
      body: GridView.extent(
        maxCrossAxisExtent: 600,
        children: articles.values.map((e) => ArticleCard(article: e)).toList(),
      ),
    );
  }
}
