import 'package:hive_flutter/hive_flutter.dart';

import 'car.dart';

part 'order.g.dart';

@HiveType(typeId: 5)
class Order extends HiveObject {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  Car car;

   @HiveField(2)
  String message;

  Order({
    required this.date,
    required this.car,
    required this.message,
  });
}

Box<Order> orders = Hive.box<Order>("orders");
