import 'package:portfolio/domain/entities/project.dart';

List<Project> get projects => [
  Project(
    title: 'CineRadar',
    description: 'Descubre películas y guarda tus favoritas en tu propia colección personalizada.',
    imagePath: 'assets/projects/cineradar.jpeg',
    tagLabels: ['flutter', 'dart', 'sqflite'],
    repositoryUrl: 'https://github.com/PPereaC/CineRadar'
  ),
  Project(
    title: 'FinMusic',
    description: 'Reproductor de música de YouTube Music sin necesidad de suscripción ni inicio de sesión.',
    imagePath: 'assets/projects/finmusic.jpeg',
    tagLabels: ['flutter', 'dart', 'sqflite'],
    repositoryUrl: 'https://github.com/PPereaC/FinMusic'
  ),
  Project(
    title: 'Porfolio',
    description: 'Portfolio personal mostrando mis proyectos, habilidades y experiencia en desarrollo.',
    imagePath: 'assets/projects/porfolio.jpeg',
    tagLabels: ['flutter', 'dart'],
    repositoryUrl: 'https://github.com/PPereaC/porfolio'
  ),
];