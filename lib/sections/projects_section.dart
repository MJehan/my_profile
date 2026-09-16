import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/common/animated_fade_in.dart';
import '../widgets/common/section_title.dart';

class Project {
  final String title;
  final String description;
  final String category;
  final String company; // NEW — "DevVoyage" | "Vivacom" | "Summit"
  final IconData icon;
  final Color color;
  final List<String> tech;
  final List<ProjectLink> links;

  Project({
    required this.title,
    required this.description,
    required this.category,
    required this.company,
    required this.icon,
    required this.color,
    required this.tech,
    required this.links,
  });
}

class ProjectLink {
  final String label;
  final String url;
  final FaIconData icon;
  ProjectLink(this.label, this.url, this.icon);
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static final List<Project> projects = [
    // ─── DevVoyage projects ─────────────────────────────────
    Project(
      title: 'My Personal Hajj Umrah Guide',
      description:
      'A comprehensive Flutter application guiding pilgrims through every step '
          'of Hajj and Umrah — with step-by-step rituals, interactive maps, '
          'checklists and personalized schedules. Published on Android and iOS.',
      category: 'Mobile · Utility',
      company: 'DevVoyage',
      icon: Icons.mosque_rounded,
      color: AppColors.secondary,
      tech: ['Flutter', 'Dart', 'Firebase', 'Google Maps', 'iOS'],
      links: [
        ProjectLink(
          'Google Play',
          'https://play.google.com/store/apps/details?id=com.tms.tms_vr_app&hl=en',
          FontAwesomeIcons.googlePlay,
        ),
        ProjectLink(
          'App Store',
          'https://apps.apple.com/us/app/my-personal-hajj-umrah-guide/id6738670362',
          FontAwesomeIcons.appStoreIos,
        ),
      ],
    ),
    Project(
      title: 'Bismillah App',
      description:
      'A Flutter-based Islamic companion app for daily guidance and prayer '
          'support — published to both Google Play and the Apple App Store.',
      category: 'Mobile · Utility',
      company: 'DevVoyage',
      icon: Icons.auto_stories_rounded,
      color: const Color(0xFF7B68EE),
      tech: ['Flutter', 'Dart', 'iOS'],
      links: [
        ProjectLink(
          'Google Play',
          'https://play.google.com/store/apps/details?id=com.mphu.bismillah&hl=en',
          FontAwesomeIcons.googlePlay,
        ),
        ProjectLink(
          'App Store',
          'https://apps.apple.com/us/app/bismillah-app/id6743954701',
          FontAwesomeIcons.appStoreIos,
        ),
      ],
    ),
    Project(
      title: 'Umrah Package App',
      description:
      'Flutter application for exploring and booking Umrah packages — with '
          'structured package details and a smooth booking flow. Published on '
          'Android and iOS.',
      category: 'Mobile · Travel',
      company: 'DevVoyage',
      icon: Icons.card_travel_rounded,
      color: const Color(0xFF4EA5FF),
      tech: ['Flutter', 'Dart', 'REST API', 'iOS'],
      links: [
        ProjectLink(
          'Google Play',
          'https://play.google.com/store/apps/details?id=com.umrah.umrahpackage&hl=en',
          FontAwesomeIcons.googlePlay,
        ),
        ProjectLink(
          'App Store',
          'https://apps.apple.com/us/app/hajj-umrah-guide-aus/id6743732988',
          FontAwesomeIcons.appStoreIos,
        ),
      ],
    ),
    Project(
      title: 'Amar Safar',
      description:
      'Full-featured travel management application covering the complete journey — '
          'exploring packages, booking, accommodation management and end-to-end trip '
          'planning.',
      category: 'Mobile · Travel',
      company: 'DevVoyage',
      icon: Icons.flight_takeoff_rounded,
      color: AppColors.primary,
      tech: ['Flutter', 'Dart', 'REST API'],
      links: [
        ProjectLink(
          'Google Play',
          'https://play.google.com/store/apps/details?id=com.amarsafar.mp&hl=en',
          FontAwesomeIcons.googlePlay,
        ),
      ],
    ),
    Project(
      title: 'Traveller Self Care',
      description:
      'iOS companion app designed to help travellers manage wellness and self-care '
          'while on the move — built with Flutter and shipped to the App Store.',
      category: 'Mobile · Lifestyle',
      company: 'DevVoyage',
      icon: Icons.self_improvement_rounded,
      color: const Color(0xFFFF6B9D),
      tech: ['Flutter', 'Dart', 'iOS'],
      links: [
        ProjectLink(
          'App Store',
          'https://apps.apple.com/us/app/traveller-self-care/id6680199701',
          FontAwesomeIcons.appStoreIos,
        ),
      ],
    ),
    Project(
      title: 'Hajj Umrah Guide AUS',
      description:
      'iOS-published Hajj and Umrah guide tailored for the Australian market — '
          'delivering rituals, schedules and checklists in a native iOS experience.',
      category: 'Mobile · Utility',
      company: 'DevVoyage',
      icon: Icons.public_rounded,
      color: const Color(0xFF00B894),
      tech: ['Flutter', 'Dart', 'iOS'],
      links: [
        ProjectLink(
          'App Store',
          'https://apps.apple.com/us/app/hajj-umrah-guide-aus/id6743732988',
          FontAwesomeIcons.appStoreIos,
        ),
      ],
    ),

    // ─── Vivacom projects ───────────────────────────────────
    Project(
      title: 'Skill Match',
      description:
      'A dual-app platform connecting professionals with clients based on '
          'registered skills. Separate builds for clients and professionals with '
          'seamless in-app communication.',
      category: 'Mobile · Marketplace',
      company: 'Vivacom',
      icon: Icons.handshake_rounded,
      color: AppColors.accent,
      tech: ['Flutter', 'Dart', 'Firebase'],
      links: [
        ProjectLink(
          'Client App',
          'https://play.google.com/store/apps/details?id=net.xirfadle.client&hl=en',
          FontAwesomeIcons.googlePlay,
        ),
        ProjectLink(
          'Pro App',
          'https://play.google.com/store/apps/details?id=net.xirfadle.x_pro&hl=en',
          FontAwesomeIcons.googlePlay,
        ),
      ],
    ),
    Project(
      title: 'Money Transfer Apps',
      description:
      'Flutter-based international money transfer applications supporting secure '
          'cross-border transactions — including PayOnTime and Hidmona platforms, '
          'available on both Android and iOS.',
      category: 'Mobile · Fintech',
      company: 'Vivacom',
      icon: Icons.currency_exchange_rounded,
      color: AppColors.success,
      tech: ['Flutter', 'Dart', 'Secure API', 'iOS'],
      links: [
        ProjectLink(
          'PayOnTime (Android)',
          'https://play.google.com/store/apps/details?id=se.payontime.app&hl=en',
          FontAwesomeIcons.googlePlay,
        ),
        ProjectLink(
          'PayOnTime (iOS)',
          'https://apps.apple.com/us/app/payontime/id6757865255',
          FontAwesomeIcons.appStoreIos,
        ),
        ProjectLink(
          'Hidmona (Android)',
          'https://play.google.com/store/search?q=hindoma+money+transfer&c=apps&hl=en',
          FontAwesomeIcons.googlePlay,
        ),
        ProjectLink(
          'Hidmona (iOS)',
          'https://apps.apple.com/us/app/hidmona-money-transfer/id1629064572',
          FontAwesomeIcons.appStoreIos,
        ),
      ],
    ),
    Project(
      title: 'Taxi App',
      description:
      'On-demand ride-hailing platform with dedicated user and driver '
          'applications — ride requests, acceptance flow and trip completion.',
      category: 'Mobile · On-Demand',
      company: 'Vivacom',
      icon: Icons.local_taxi_rounded,
      color: const Color(0xFFFFB020),
      tech: ['Flutter', 'Dart', 'Maps', 'Real-time'],
      links: [
        ProjectLink(
          'Driver App',
          'https://play.google.com/store/apps/details?id=com.vivacom.driver_taxi&hl=en',
          FontAwesomeIcons.googlePlay,
        ),
        ProjectLink(
          'User App',
          'https://play.google.com/store/apps/details?id=com.vivacom.user_taxi&hl=en',
          FontAwesomeIcons.googlePlay,
        ),
      ],
    ),
    Project(
      title: 'Batobaya Ecommerce',
      description:
      'Cross-platform Flutter eCommerce application — built and maintained with a '
          'focus on smooth browsing, cart and checkout experience.',
      category: 'Mobile · E-commerce',
      company: 'Vivacom',
      icon: Icons.shopping_bag_rounded,
      color: const Color(0xFFFF6B9D),
      tech: ['Flutter', 'Dart', 'REST API'],
      links: [
        ProjectLink(
          'Google Play',
          'https://play.google.com/store/search?q=batobaye&c=apps&hl=en',
          FontAwesomeIcons.googlePlay,
        ),
      ],
    ),
    Project(
      title: 'Hajj Umrah Guide (TMS VR)',
      description:
      'Vivacom\'s Hajj and Umrah guidance app with immersive content and structured '
          'rituals — shipped as part of a multi-app pilgrimage suite.',
      category: 'Mobile · Utility',
      company: 'Vivacom',
      icon: Icons.view_in_ar_rounded,
      color: const Color(0xFF8E7CFF),
      tech: ['Flutter', 'Dart', 'VR', 'Firebase'],
      links: [
        ProjectLink(
          'Google Play',
          'https://play.google.com/store/apps/details?id=com.tms.tms_vr_app&hl=en',
          FontAwesomeIcons.googlePlay,
        ),
      ],
    ),

    // ─── Summit ─────────────────────────────────────────────
    Project(
      title: 'Field Force Tracker',
      description:
      'Flutter application for Summit Communications tracking field employees in '
          'real time on Google Maps, with Firebase persistence and a background '
          'location service on Android.',
      category: 'Mobile · Enterprise',
      company: 'Summit',
      icon: Icons.location_on_rounded,
      color: const Color(0xFF4EA5FF),
      tech: ['Flutter', 'Firebase', 'Google Maps', 'Android Service'],
      links: [],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final columns = Responsive.projectColumns(context);
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
              eyebrow: 'Portfolio',
              title: 'Featured Projects',
              subtitle:
              'A selection of Flutter applications I have designed, developed '
                  'and published to production.',
            ),
          ),
          const SizedBox(height: 60),
          LayoutBuilder(
            builder: (context, constraints) {
              final spacing = isMobile ? 20.0 : 24.0;
              final totalSpacing = spacing * (columns - 1);
              final cardWidth = (constraints.maxWidth - totalSpacing) / columns;

              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: List.generate(projects.length, (i) {
                  return AnimatedFadeIn(
                    delay: Duration(milliseconds: 80 * (i % 3)),
                    child: SizedBox(
                      width: cardWidth,
                      child: _ProjectCard(project: projects[i]),
                    ),
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Project project;
  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final p = widget.project;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 260),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, _hovered ? -6 : 0, 0),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _hovered ? p.color.withOpacity(0.6) : AppColors.border,
            width: 1.2,
          ),
          boxShadow: _hovered
              ? [
            BoxShadow(
              color: p.color.withOpacity(0.22),
              blurRadius: 32,
              offset: const Offset(0, 14),
            ),
          ]
              : [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top visual banner
              Container(
                height: 130,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      p.color.withOpacity(0.22),
                      AppColors.surface,
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -20,
                      bottom: -20,
                      child: Icon(
                        p.icon,
                        size: 140,
                        color: p.color.withOpacity(0.12),
                      ),
                    ),
                    Positioned(
                      left: 22,
                      top: 22,
                      child: Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: p.color.withOpacity(0.18),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: p.color.withOpacity(0.5)),
                        ),
                        alignment: Alignment.center,
                        child: Icon(p.icon, color: p.color, size: 26),
                      ),
                    ),
                    // Category chip (top-right)
                    Positioned(
                      right: 16,
                      top: 18,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.background.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: p.color.withOpacity(0.4)),
                        ),
                        child: Text(
                          p.category,
                          style: TextStyle(
                            color: p.color,
                            fontSize: 10.5,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.4,
                          ),
                        ),
                      ),
                    ),
                    // Company chip (below category chip)
                    Positioned(
                      right: 16,
                      top: 52,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.background.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.business_center_rounded,
                              color: AppColors.textSecondary,
                              size: 11,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              p.company,
                              style: const TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(p.title, style: theme.textTheme.titleLarge),
                    const SizedBox(height: 10),
                    Text(
                      p.description,
                      style: theme.textTheme.bodyMedium,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 18),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: p.tech
                          .map(
                            (t) => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.border),
                          ),
                          child: Text(
                            t,
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                          .toList(),
                    ),
                    if (p.links.isNotEmpty) ...[
                      const SizedBox(height: 20),
                      Divider(color: AppColors.border.withOpacity(0.7)),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: p.links
                            .map(
                              (l) => _LinkChip(
                            link: l,
                            color: p.color,
                          ),
                        )
                            .toList(),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LinkChip extends StatefulWidget {
  final ProjectLink link;
  final Color color;
  const _LinkChip({required this.link, required this.color});

  @override
  State<_LinkChip> createState() => _LinkChipState();
}

class _LinkChipState extends State<_LinkChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(widget.link.url)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          decoration: BoxDecoration(
            color: _hovered
                ? widget.color.withOpacity(0.18)
                : AppColors.surface,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _hovered ? widget.color : AppColors.border,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                widget.link.icon,
                size: 13,
                color: _hovered ? widget.color : AppColors.textSecondary,
              ),
              const SizedBox(width: 8),
              Text(
                widget.link.label,
                style: TextStyle(
                  color: _hovered ? widget.color : AppColors.textSecondary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}