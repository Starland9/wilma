import 'package:hive_flutter/hive_flutter.dart';
part 'client.g.dart';

@HiveType(typeId: 3)
class Client extends HiveObject {
  @HiveField(0)
  String nom;

  @HiveField(1)
  String email;

  @HiveField(2)
  String phone;

  @HiveField(3)
  String mdp;

  @HiveField(4)
  bool isAdmin;

  Client({
    required this.nom,
    required this.email,
    required this.phone,
    required this.mdp,
    required this.isAdmin,
  });
}

Box<Client> clients = Hive.box<Client>("clients");
