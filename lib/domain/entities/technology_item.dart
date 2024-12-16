enum TechnologyLevel {
  basic,     // Básico
  medium,    // Intermedio
  advanced,  // Avanzado
  expert     // Experto
}

class TechnologyItem {
  final String name;
  final String imagePath;
  final TechnologyLevel level;

  TechnologyItem({required this.name, required this.imagePath, required this.level});
}