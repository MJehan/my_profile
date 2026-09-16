import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/common/animated_fade_in.dart';
import '../widgets/common/section_title.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

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
              eyebrow: 'Career',
              title: 'Work Experience',
              subtitle:
              'Building production-grade Flutter applications across fintech, '
                  'travel, e-commerce and utility domains.',
            ),
          ),
          const SizedBox(height: 60),

          // ─── Vivacom Limited ────────────────────────────────
          AnimatedFadeIn(
            delay: const Duration(milliseconds: 100),
            child: _TimelineEntry(
              company: 'Vivacom Limited',
              role: 'App Developer',
              period: 'February 2022 – Present',
              isCurrent: true,
              description:
              'Designed and shipped multiple cross-platform Flutter '
                  'applications spanning fintech, on-demand services, marketplaces '
                  'and e-commerce.',
              highlights: const [
                'Skill Match (Client + Pro)',
                'Money Transfer (PayOnTime, Hidmona)',
                'Taxi App (User + Driver)',
                'Batobaya Ecommerce',
                'Hajj Umrah Guide (TMS VR)',
              ],
              isMobile: isMobile,
            ),
          ),
          const SizedBox(height: 28),

          // ─── DevVoyage ──────────────────────────────────────
          AnimatedFadeIn(
            delay: const Duration(milliseconds: 200),
            child: _TimelineEntry(
              company: 'DevVoyage',
              role: 'App Developer (Part-time)',
              period: 'February 2023 – January 2025',
              isCurrent: false,
              description:
              'Worked part-time on a portfolio of Hajj/Umrah and travel apps '
                  'shipped to both Google Play and the Apple App Store.',
              highlights: const [
                'My Personal Hajj Umrah Guide',
                'Bismillah App',
                'Umrah Package App',
                'Amar Safar – Travel Management',
                'Traveller Self Care',
                'Hajj Umrah Guide AUS',
              ],
              isMobile: isMobile,
            ),
          ),
          const SizedBox(height: 28),

          // ─── Summit Communications ──────────────────────────
          AnimatedFadeIn(
            delay: const Duration(milliseconds: 300),
            child: _TimelineEntry(
              company: 'Summit Communications Limited',
              role: 'App Developer',
              period: 'January 2021 – January 2022',
              isCurrent: false,
              description:
              'Built a Flutter-based field-force tracking application with '
                  'real-time location services running in the background on Android.',
              highlights: const [
                'Field Force App',
                'Real-time Google Maps tracking',
                'Firebase data persistence',
                'Background location service',
              ],
              isMobile: isMobile,
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineEntry extends StatelessWidget {
  final String company;
  final String role;
  final String period;
  final bool isCurrent;
  final String description;
  final List<String> highlights;
  final bool isMobile;

  const _TimelineEntry({
    required this.company,
    required this.role,
    required this.period,
    required this.isCurrent,
    required this.description,
    required this.highlights,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isMobile)
          Column(
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.secondary],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.5),
                      blurRadius: 14,
                    ),
                  ],
                ),
              ),
              Container(
                width: 2,
                height: 220,
                color: AppColors.border,
              ),
            ],
          ),
        if (!isMobile) const SizedBox(width: 24),
        Expanded(
          child: _HoverCard(
            child: Container(
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        company,
                        style: theme.textTheme.titleLarge,
                      ),
                      if (isCurrent)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: AppColors.success.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: AppColors.success.withOpacity(0.4)),
                          ),
                          child: const Text(
                            'Current',
                            style: TextStyle(
                              color: AppColors.success,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    role,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    period,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(description, style: theme.textTheme.bodyMedium),
                  const SizedBox(height: 18),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: highlights
                        .map(
                          (h) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 7),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Text(
                          h,
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _HoverCard extends StatefulWidget {
  final Widget child;
  const _HoverCard({required this.child});

  @override
  State<_HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<_HoverCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.translationValues(0, _hovered ? -4 : 0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: _hovered
              ? [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.15),
              blurRadius: 30,
              offset: const Offset(0, 12),
            ),
          ]
              : [],
        ),
        child: widget.child,
      ),
    );
  }
}