import 'package:faker/faker.dart';

class GenreReparation {
  String title;
  String description;

  GenreReparation({
    required this.title,
    this.description = '',
  }) {
    description = faker.lorem.sentence();
  }

  String get iconPath => "images/icons/icon-${title.toLowerCase()}.png";
}

List<GenreReparation> genresReparations = [
  GenreReparation(title: "Carosserie"),
  GenreReparation(title: "Climatisation"),
  GenreReparation(title: "Direction"),
  GenreReparation(title: "Eclairage"),
  GenreReparation(title: "Frein"),
  GenreReparation(title: "Moteur"),
  GenreReparation(title: "Train-Roulant"),
  GenreReparation(title: "Transmission"),
];
