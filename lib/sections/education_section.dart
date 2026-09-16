import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/common/animated_fade_in.dart';
import '../widgets/common/section_title.dart';

class EducationEntry {
  final String degree;
  final String institution;
  final String period;
  final String result;
  final IconData icon;

  EducationEntry({
    required this.degree,
    required this.institution,
    required this.period,
    required this.result,
    required this.icon,
  });
}

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  static final List<EducationEntry> entries = [
    EducationEntry(
      degree: 'B.Sc in Computer Science & Engineering',
      institution: 'East West University, Dhaka',
      period: 'April 2016 – February 2021',
      result: 'CGPA: 3.40 / 4.00',
      icon: Icons.school_rounded,
    ),
    EducationEntry(
      degree: 'Higher Secondary Certificate (HSC)',
      institution: 'Dinajpur Cantonment Public School and College',
      period: 'August 2015',
      result: 'CGPA: 4.83 / 5.00',
      icon: Icons.menu_book_rounded,
    ),
    EducationEntry(
      degree: 'Secondary School Certificate (SSC)',
      institution: 'Panchbibi L.B Pilot Govt. High School, Joypurhat',
      period: 'April 2013',
      result: 'CGPA: 5.00 / 5.00',
      icon: Icons.workspace_premium_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.horizontalPadding(context),
        vertical: Responsive.sectionPadding(context),
      ),
      child: Column(
        children: [
          const AnimatedFadeIn(
            child: SectionTitle(
              eyebrow: 'Background',
              title: 'Education',
            ),
          ),
          const SizedBox(height: 50),
          ...entries.asMap().entries.map((e) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: AnimatedFadeIn(
                delay: Duration(milliseconds: 100 * e.key),
                child: _EducationCard(entry: e.value, isMobile: isMobile),
              ),
            );
          }),
          const SizedBox(height: 30),
          AnimatedFadeIn(
            delay: const Duration(milliseconds: 400),
            child: _LanguagesCard(),
          ),
        ],
      ),
    );
  }
}

class _EducationCard extends StatefulWidget {
  final EducationEntry entry;
  final bool isMobile;
  const _EducationCard({required this.entry, required this.isMobile});

  @override
  State<_EducationCard> createState() => _EducationCardState();
}

class _EducationCardState extends State<_EducationCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final e = widget.entry;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        transform: Matrix4.translationValues(_hovered ? 6 : 0, 0, 0),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: _hovered ? AppColors.primary : AppColors.border,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.14),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                    color: AppColors.primary.withOpacity(0.35)),
              ),
              alignment: Alignment.center,
              child: Icon(e.icon, color: AppColors.primary, size: 24),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e.degree,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    e.institution,
                    style: const TextStyle(
                      color: AppColors.secondary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 14,
                    runSpacing: 6,
                    children: [
                      _Info(icon: Icons.calendar_today_rounded, text: e.period),
                      _Info(icon: Icons.grade_rounded, text: e.result),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Info extends StatelessWidget {
  final IconData icon;
  final String text;
  const _Info({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.textSecondary, size: 13),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12.5,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _LanguagesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.translate_rounded,
                  color: AppColors.secondary, size: 20),
              SizedBox(width: 10),
              Text(
                'Languages',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: const [
              _LangChip(label: 'Bangla', level: 'Native'),
              _LangChip(label: 'English', level: 'Professional'),
              _LangChip(label: 'Hindi', level: 'Conversational'),
              _LangChip(label: 'Urdu', level: 'Conversational'),

            ],
          ),
        ],
      ),
    );
  }
}

class _LangChip extends StatelessWidget {
  final String label;
  final String level;
  const _LangChip({required this.label, required this.level});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.language_rounded,
              color: AppColors.primary, size: 16),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                level,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}