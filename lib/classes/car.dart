import 'package:hive_flutter/hive_flutter.dart';

part 'car.g.dart';

@HiveType(typeId: 1)
class Car extends HiveObject {
  @HiveField(0)
  String model;

  @HiveField(1)
  String carImagePath;

  @HiveField(2)
  String carModelLogoPath;

  Car({
    required this.model,
    required this.carImagePath,
    required this.carModelLogoPath,
  });
}

Box<Car> cars = Hive.box<Car>("cars");
