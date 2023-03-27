import 'package:hive_flutter/hive_flutter.dart';
import 'package:wilma/classes/article.dart';

part 'cart.g.dart';

@HiveType(typeId: 4)
class Cart extends HiveObject {
  @HiveField(0)
  List<Map<Article, int>> items = [];

  Cart({
    required this.items,
  });
}

Box<Cart> carts = Hive.box<Cart>("carts");
