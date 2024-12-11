import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class IntroductionSection extends StatelessWidget {

  final bool isMobile;

  const IntroductionSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height: isMobile ? height * 0.03 : height * 0.1),

            // Foto de perfil
            const _HeaderPhoto(),
            
            const SizedBox(height: 30),
            
            // Notificación flotante
            const JobNotification(),
            
            const SizedBox(height: 30),
            
            // Texto de presentación
            const _TextPresentation(),
            
            const SizedBox(height: 30),
            
            // Botones de links
            const LinkButtons(),
            
            SizedBox(height: isMobile ? height * 0.05 : height * 0.2),
            
            // Flecha hacia abajo para indicar scroll
            const _ArrowDown(),
            
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class _HeaderPhoto extends StatelessWidget {

  const _HeaderPhoto();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Center(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colors.primary.withOpacity(0.8),
              colors.secondary.withOpacity(0.6),
            ],
          ),
          border: Border.all(
            color: colors.primary.withOpacity(0.8),
            width: 2,
          ),
          boxShadow: [
            // Efecto neón
            BoxShadow(
              color: colors.primary.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 0),
            ),
            // Sombra base
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Foto base
            ClipOval(
              child: Image.asset(
                'assets/images/foto.png',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TextPresentation extends StatelessWidget {
  const _TextPresentation();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: LayoutBuilder(
            builder: (context, constraints) {
              const minWidth = 600.0;
              const maxWidth = 1200.0;

              double factor;
              if (screenWidth < minWidth) {
                factor = 0.8;
              } else {
                // Calcular el factor de escala entre 0.4 y 0.8
                factor = 0.4 + ((screenWidth - minWidth) / (maxWidth - minWidth)) * 0.4;
                factor = factor.clamp(0.4, 0.8);
              }

              return Column(
                children: [
                  SizedBox(
                    width: screenWidth * factor,
                    child: Text(
                      '¡Hola! soy Pablo.',
                      style: textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: screenWidth * factor,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: textTheme.bodyLarge,
                        children: [
                          const TextSpan(
                            text: 'Mi pasión es crear ',
                          ),
                          TextSpan(
                            text: 'aplicaciones ',
                            style: textTheme.bodyLarge?.copyWith(
                              color: colors.secondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(
                            text: 'que marquen la diferencia.\n'
                                'Siempre en búsqueda de ',
                          ),
                          TextSpan(
                            text: 'nuevos desafíos ',
                            style: textTheme.bodyLarge?.copyWith(
                              color: colors.secondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(
                            text: 'y oportunidades para \n',
                          ),
                          TextSpan(
                            text: 'crecer profesionalmente.',
                            style: textTheme.bodyLarge?.copyWith(
                              color: colors.secondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ArrowDown extends StatefulWidget {
  const _ArrowDown();

  @override
  __ArrowDownState createState() => __ArrowDownState();
}

class __ArrowDownState extends State<_ArrowDown> {
  bool _animate = false;
  bool _isResizing = false;

  @override
  void initState() {
    super.initState();
    _startAnimationLoop();
  }

  void _startAnimationLoop() async {
    while (mounted) {
      if (!_isResizing) {
        setState(() {
          _animate = true;
        });
        await Future.delayed(const Duration(milliseconds: 800));
        if (mounted) {
          setState(() {
            _animate = false;
          });
        }
        await Future.delayed(const Duration(seconds: 8));
      } else {
        await Future.delayed(const Duration(milliseconds: 100));
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isResizing = false;
    });
  }

  @override
  void dispose() {
    _isResizing = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _isResizing = false;
        });

        return Bounce(
          animate: _animate,
          from: 8,
          duration: const Duration(milliseconds: 800),
          child: Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 40,
            color: colors.primary,
          ),
        );
      },
    );
  }
}