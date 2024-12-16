import 'package:portfolio/domain/entities/project.dart';

List<Project> get projects => [
  Project(
    title: 'CineRadar',
    description: 'Descubre películas y guarda tus favoritas en tu propia colección personalizada.',
    imagePath: 'assets/projects/cineradar.png',
    tagLabels: ['flutter', 'dart', 'sqflite'],
    repositoryUrl: 'https://github.com/PPereaC/CineRadar'
  )
];