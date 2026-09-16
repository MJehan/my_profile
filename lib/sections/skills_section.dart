import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/common/animated_fade_in.dart';
import '../widgets/common/section_title.dart';

class SkillGroup {
  final String title;
  final IconData icon;
  final Color color;
  final List<String> skills;
  final bool featured;

  SkillGroup({
    required this.title,
    required this.icon,
    required this.color,
    required this.skills,
    this.featured = false,
  });
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static final List<SkillGroup> groups = [
    SkillGroup(
      title: 'Mobile & Frontend',
      icon: Icons.phone_iphone_rounded,
      color: AppColors.primary,
      featured: true,
      skills: const [
        'Flutter',
        'Dart',
        'HTML',
        'CSS',
        'JavaScript',
        'Bootstrap',
      ],
    ),
    SkillGroup(
      title: 'Backend & Database',
      icon: Icons.storage_rounded,
      color: AppColors.secondary,
      skills: const [
        'Firebase Firestore',
        'MongoDB',
      ],
    ),
    SkillGroup(
      title: 'Tools',
      icon: Icons.build_rounded,
      color: AppColors.accent,
      skills: const [
        'Git',
        'Android Studio',
        'Visual Studio',
        'Code::Blocks',
        'Dev-C++',
      ],
    ),
    SkillGroup(
      title: 'Platforms',
      icon: Icons.devices_rounded,
      color: const Color(0xFFFFB020),
      skills: const [
        'macOS',
        'Windows',
        'Linux',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final columns = Responsive.isDesktop(context) ? 4 : 2;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.horizontalPadding(context),
        vertical: Responsive.sectionPadding(context),
      ),
      color: AppColors.surface.withOpacity(0.4),
      child: Column(
        children: [
          const AnimatedFadeIn(
            child: SectionTitle(
              eyebrow: 'Expertise',
              title: 'Skills & Technologies',
              subtitle:
              'My primary focus is Flutter and Dart — backed by a solid '
                  'foundation in web technologies, backend services and modern tooling.',
            ),
          ),
          const SizedBox(height: 50),
          // Highlight banner
          AnimatedFadeIn(
            delay: const Duration(milliseconds: 120),
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 24, vertical: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary.withOpacity(0.18),
                    AppColors.accent.withOpacity(0.14),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.primary.withOpacity(0.4)),
              ),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 14,
                runSpacing: 10,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Icon(Icons.star_rounded, color: AppColors.secondary, size: 20),
                  Text(
                    'Primary Technologies:',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  _PrimaryChip(label: 'Flutter'),
                  _PrimaryChip(label: 'Dart'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              const spacing = 20.0;
              final cardWidth =
                  (constraints.maxWidth - spacing * (columns - 1)) / columns;
              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: groups
                    .map(
                      (g) => SizedBox(
                    width: cardWidth,
                    child: AnimatedFadeIn(
                      child: _SkillCard(group: g),
                    ),
                  ),
                )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _PrimaryChip extends StatelessWidget {
  final String label;
  const _PrimaryChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.accent],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _SkillCard extends StatefulWidget {
  final SkillGroup group;
  const _SkillCard({required this.group});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final g = widget.group;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 240),
        transform: Matrix4.translationValues(0, _hovered ? -5 : 0, 0),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: _hovered
                ? g.color.withOpacity(0.55)
                : AppColors.border,
          ),
          boxShadow: _hovered
              ? [
            BoxShadow(
              color: g.color.withOpacity(0.2),
              blurRadius: 26,
              offset: const Offset(0, 12),
            ),
          ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: g.color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: g.color.withOpacity(0.4)),
              ),
              alignment: Alignment.center,
              child: Icon(g.icon, color: g.color, size: 22),
            ),
            const SizedBox(height: 16),
            Text(
              g.title,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            if (g.featured)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: g.color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'PRIMARY',
                    style: TextStyle(
                      color: g.color,
                      fontSize: 9.5,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 14),
            ...g.skills.map(
                  (s) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: g.color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        s,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 13.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}