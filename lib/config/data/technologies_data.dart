import '../../domain/entities/technology_item.dart';

// INFO: Cuando se agregue una nueva tecnología se debe pasar primero
// por la siguiente página: https://jakearchibald.github.io/svgomg/

List<TechnologyItem> get technologies => [
  TechnologyItem(
    name: 'Flutter', 
    imagePath: 'assets/technologies/flutter.svg',
    level: TechnologyLevel.medium
  ),
  TechnologyItem(
    name: 'Dart', 
    imagePath: 'assets/technologies/dart.svg',
    level: TechnologyLevel.medium
  ),
  TechnologyItem(
    name: 'Firebase', 
    imagePath: 'assets/technologies/firebase.svg',
    level: TechnologyLevel.medium
  ),
  TechnologyItem(
    name: 'Java', 
    imagePath: 'assets/technologies/java.svg',
    level: TechnologyLevel.medium
  ),
  TechnologyItem(
    name: 'MySQL', 
    imagePath: 'assets/technologies/mysql.svg',
    level: TechnologyLevel.advanced
  ),
  TechnologyItem(
    name: 'HTML', 
    imagePath: 'assets/technologies/html.svg',
    level: TechnologyLevel.advanced
  ),
  TechnologyItem(
    name: 'CSS', 
    imagePath: 'assets/technologies/css.svg',
    level: TechnologyLevel.medium
  ),
  TechnologyItem(
    name: 'Javascript', 
    imagePath: 'assets/technologies/javascript.svg',
    level: TechnologyLevel.medium
  ),
  TechnologyItem(
    name: 'PHP', 
    imagePath: 'assets/technologies/php.svg',
    level: TechnologyLevel.basic
  ),
  TechnologyItem(
    name: 'Laravel', 
    imagePath: 'assets/technologies/laravel.svg',
    level: TechnologyLevel.basic
  ),
  TechnologyItem(
    name: 'Git', 
    imagePath: 'assets/technologies/git.svg',
    level: TechnologyLevel.medium
  ),
  TechnologyItem(
    name: 'C#', 
    imagePath: 'assets/technologies/csharp.svg',
    level: TechnologyLevel.basic
  ),
  TechnologyItem(
    name: 'Linux', 
    imagePath: 'assets/technologies/linux.svg',
    level: TechnologyLevel.medium
  ),
];