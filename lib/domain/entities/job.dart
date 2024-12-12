class Job {
  final String company;
  final String position;
  final String period;
  final String description;
  final List<String> technologies;
  final String? companyUrl;

  Job({
    required this.company,
    required this.position, 
    required this.period,
    required this.description,
    required this.technologies,
    this.companyUrl,
  });
}