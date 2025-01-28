import '../../domain/entities/job.dart';

List<Job> get jobs => [
  Job(
    company: 'SUPERMERCADO LAS PALMERAS S.L',
    position: 'Desarrollador de software',
    period: 'oct. 2024 - nov. 2024 (2 meses) | Contrato por obra o servicio',
    description: 'Desarrollé una aplicación de escritorio en Flutter para la gestión de productos, generando etiquetas con códigos de barras, nombre, cantidad, precio, y precio por KG/L para optimizar la organización y venta en el supermercado.',
    technologies: ['Flutter', 'Microsoft Word', 'Isar Database'],
    companyUrl: '',
  ),
  Job(
    company: 'VICENTE NAVAS S.L',
    position: 'Desarrollador de aplicaciones',
    period: 'jul. 2024 - ago. 2024 (2 meses) | Contrato por obra o servicio',
    description: 'Desarrollé una aplicación en Flutter para empleados, permitiendo gestionar y ver información de enfriadoras, con escaneo de QR para datos de máquinas físicas.',
    technologies: ['Flutter', 'Firebase'],
    companyUrl: 'https://www.vicentenavassl.com/',
  ),
  Job(
    company: 'DELTANET SISTEMAS DE INFORMACIÓN',
    position: 'Desarrollador de aplicaciones móviles y web',
    period: 'abr. 2024 - jun. 2024 (3 meses) | Prácticas en empresa',
    description: 'Durante tres meses de prácticas, desarrollé aplicaciones multiplataforma con Flutter y participé en un proyecto web usando PHP/Laravel.\nImplementé soluciones personalizadas y trabajé con APIs RESTful, abarcando tanto frontend como backend.',
    technologies: ['Flutter', 'Firebase', 'PHP', 'Laravel', 'MySQL', 'API RESTful'],
    companyUrl: 'https://www.deltanet.es/',
  ),
];