import 'package:hive_flutter/hive_flutter.dart';

import 'cart.dart';

part 'order.g.dart';

@HiveType(typeId: 5)
class Order extends HiveObject {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  Cart cart;

  Order({
    required this.date,
    required this.cart,
  });
}

Box<Order> orders = Hive.box<Order>("orders");
