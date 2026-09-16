import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/constants.dart';
import '../utils/responsive.dart';
import '../widgets/common/animated_fade_in.dart';
import '../widgets/common/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final theme = Theme.of(context);

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
              eyebrow: 'About Me',
              title: 'Turning Ideas Into\nScalable Mobile Apps',
            ),
          ),
          const SizedBox(height: 50),
          AnimatedFadeIn(
            delay: const Duration(milliseconds: 150),
            child: isMobile
                ? Column(
              children: [
                _textCard(theme),
                const SizedBox(height: 24),
                _statsGrid(context),
              ],
            )
                : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 5, child: _textCard(theme)),
                const SizedBox(width: 40),
                Expanded(flex: 4, child: _statsGrid(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _textCard(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.code_rounded, color: AppColors.secondary, size: 22),
              SizedBox(width: 10),
              Text(
                'Professional Summary',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(AppConstants.summary, style: theme.textTheme.bodyLarge),
          const SizedBox(height: 20),
          Text(
            'I focus on writing clean, maintainable code with solid architecture — '
                'whether it\'s a simple utility app or a full-scale platform with '
                'multiple user roles.',
            style: theme.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }

  Widget _statsGrid(BuildContext context) {
    final stats = [
      _Stat('5+', 'Years Experience', Icons.timeline_rounded),
      _Stat('15+', 'Published Apps', Icons.apps_rounded),
      _Stat('3', 'Companies', Icons.business_center_rounded),
      _Stat('100%', 'Flutter Focused', Icons.flutter_dash_rounded),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: stats.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.15,
      ),
      itemBuilder: (context, i) => _StatCard(stat: stats[i]),
    );
  }
}

class _Stat {
  final String value;
  final String label;
  final IconData icon;
  _Stat(this.value, this.label, this.icon);
}

class _StatCard extends StatefulWidget {
  final _Stat stat;
  const _StatCard({required this.stat});

  @override
  State<_StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<_StatCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: _hovered ? AppColors.primary.withOpacity(0.08) : AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hovered ? AppColors.primary : AppColors.border,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(widget.stat.icon,
                color: _hovered ? AppColors.secondary : AppColors.primary,
                size: 22),
            const Spacer(),
            Text(
              widget.stat.value,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.stat.label,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}