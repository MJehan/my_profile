import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../utils/responsive.dart';

class SectionTitle extends StatelessWidget {
  final String eyebrow;
  final String title;
  final String? subtitle;
  final CrossAxisAlignment alignment;

  const SectionTitle({
    super.key,
    required this.eyebrow,
    required this.title,
    this.subtitle,
    this.alignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: alignment,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.12),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColors.primary.withOpacity(0.3)),
          ),
          child: Text(
            eyebrow.toUpperCase(),
            style: TextStyle(
              color: AppColors.secondary,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
            ),
          ),
        ),
        const SizedBox(height: 18),
        Text(
          title,
          textAlign: alignment == CrossAxisAlignment.center
              ? TextAlign.center
              : TextAlign.left,
          style: isMobile
              ? theme.textTheme.displaySmall
              : theme.textTheme.displayMedium,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Text(
              subtitle!,
              textAlign: alignment == CrossAxisAlignment.center
                  ? TextAlign.center
                  : TextAlign.left,
              style: theme.textTheme.bodyLarge,
            ),
          ),
        ],
      ],
    );
  }
}