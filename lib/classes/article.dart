import 'package:hive_flutter/hive_flutter.dart';
part 'article.g.dart';

@HiveType(typeId: 2)
class Article extends HiveObject {
  @HiveField(0)
  String nom;

  @HiveField(1)
  String description;

  @HiveField(2)
  double prix;

  @HiveField(3)
  String imagePath;

  Article({
    required this.nom,
    required this.description,
    required this.prix,
    required this.imagePath,
  });
}

Box<Article> articles = Hive.box<Article>("articles");
