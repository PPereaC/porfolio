import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/data/jobs_data.dart';
import '../../config/utils/constants.dart';
import '../../domain/entities/job.dart';

class JobsSection extends StatelessWidget {
  final bool isMobile;
  
  const JobsSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final height = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          const minWidth = 600.0;
          const maxWidth = 1200.0;
  
          double factor = screenWidth < minWidth 
            ? 0.8 
            : (0.4 + ((screenWidth - minWidth) / (maxWidth - minWidth)) * 0.4).clamp(0.4, 0.8);

          return Column(
            children: [
              SizedBox(
                width: screenWidth * factor,
                child: Text(
                  'Experiencia Laboral',
                  style: textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: isMobile ? height * 0.03 : height * 0.06),
              SizedBox(
                width: screenWidth * factor,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: jobs.length,
                  itemBuilder: (context, index) {
                    final job = jobs[index];
                    return TimelineJob(
                      isMobile: isMobile,
                      job: job,
                      isLast: index == jobs.length - 1,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class TimelineJob extends StatelessWidget {
  final Job job;
  final bool isLast;
  final bool isMobile;

  const TimelineJob({
    super.key,
    required this.job,
    required this.isLast,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTimeline(colors, isLast),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 32.0),
              child: _buildJobContent(context, job, textTheme, colors, isMobile),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline(ColorScheme colors, bool isLast) {
    return SizedBox(
      width: 40,
      child: Column(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors.secondary,
            ),
          ),
          if (!isLast)
            Expanded(
              child: Container(
                width: 2,
                color: colors.secondary.withOpacity(0.2),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildJobContent(BuildContext context, Job job, TextTheme textTheme, ColorScheme colors, bool isMobile) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          // Información principal
          Text(
            job.period,
            style: textTheme.bodyMedium?.copyWith(
              color: colors.primary,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 4),

          // Nombre del puesto de trabajo
          Text(
            job.position,
            style: isMobile ?
            textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            )
            :
            textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          // Nombre de la empresa
          _buildCompanyName(job, textTheme, colors),

          const SizedBox(height: 8),

          // Descripción
          Text(
            job.description,
            style: textTheme.bodyMedium,
          ),

          const SizedBox(height: 8),

          // Tecnologías utilizadas en el trabajo
          _buildTechnologies(job, textTheme),

          const SizedBox(height: 8),
        ],
      );
    }

    // Vista desktop
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLeftColumn(context, job, textTheme, colors),
        const SizedBox(width: 24),
        _buildRightColumn(job, textTheme, colors),
      ],
    );
  }

  Widget _buildLeftColumn(BuildContext context, Job job, TextTheme textTheme, ColorScheme colors) {

    final height = MediaQuery.of(context).size.height;

    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            job.period,
            style: textTheme.bodyMedium?.copyWith(
              color: colors.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            job.position,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: height * 0.02),
          _buildCompanyName(job, textTheme, colors),
          SizedBox(height: height * 0.02),
          _buildTechnologies(job, textTheme),
        ],
      ),
    );
  }

  Widget _buildRightColumn(Job job, TextTheme textTheme, ColorScheme colors) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              job.description,
              style: textTheme.bodyLarge
            ),
          ),
          const SizedBox(height: 8),
          TextButton(
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              splashFactory: NoSplash.splashFactory,
            ),
            onPressed: () => launchUrl(Uri.parse(linkedinUrl)),
            child: Text(
              'Saber más >',
              style: textTheme.bodyLarge?.copyWith(
                color: colors.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyName(Job job, TextTheme textTheme, ColorScheme colors) {
    if (job.companyUrl != null) {
      return InkWell(
        onTap: () => launchUrl(Uri.parse(job.companyUrl!)),
        child: Text(
          job.company,
          style: isMobile ? 
          textTheme.bodyMedium?.copyWith(
            color: colors.primary,
            decoration: TextDecoration.underline,
          )
          :
          textTheme.bodyLarge?.copyWith(
            color: colors.primary,
            decoration: TextDecoration.underline,
          ),
        ),
      );
    }
    return Text(
      job.company,
      style: textTheme.bodyLarge,
    );
  }

  Widget _buildTechnologies(Job job, TextTheme textTheme) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: job.technologies.map((tech) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          tech,
          style: textTheme.bodyMedium?.copyWith(
            color: Colors.grey[800],
          ),
        ),
      )).toList(),
    );
  }
}