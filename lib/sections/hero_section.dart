import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../utils/constants.dart';
import '../utils/responsive.dart';
import '../widgets/common/animated_fade_in.dart';
import '../widgets/common/custom_button.dart';
import '../utils/cv_service.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onContactTap;
  final VoidCallback onProjectsTap;

  const HeroSection({
    super.key,
    required this.onContactTap,
    required this.onProjectsTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.horizontalPadding(context),
        vertical: isMobile ? 60 : 100,
      ),
      child: isMobile
          ? Column(
        children: [
          _buildTextContent(context, theme),
          const SizedBox(height: 50),
          _buildAvatar(context),
        ],
      )
          : Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 6, child: _buildTextContent(context, theme)),
          const SizedBox(width: 60),
          Expanded(flex: 4, child: _buildAvatar(context)),
        ],
      ),
    );
  }

  Widget _buildTextContent(BuildContext context, ThemeData theme) {
    final isMobile = Responsive.isMobile(context);
    return Column(
      crossAxisAlignment:
      isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        AnimatedFadeIn(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.success,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  '5+ years of Flutter experience',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 26),
        AnimatedFadeIn(
          delay: const Duration(milliseconds: 120),
          child: Text(
            "Hi, I'm",
            style: theme.textTheme.headlineMedium?.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w400,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
          ),
        ),
        const SizedBox(height: 6),
        AnimatedFadeIn(
          delay: const Duration(milliseconds: 200),
          child: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [AppColors.primary, AppColors.secondary, AppColors.accent],
            ).createShader(bounds),
            child: Text(
              AppConstants.name,
              style: (isMobile
                  ? theme.textTheme.displayMedium
                  : theme.textTheme.displayLarge)
                  ?.copyWith(color: Colors.white),
              textAlign: isMobile ? TextAlign.center : TextAlign.left,
            ),
          ),
        ),
        const SizedBox(height: 12),
        AnimatedFadeIn(
          delay: const Duration(milliseconds: 280),
          child: Text(
            AppConstants.role,
            style: theme.textTheme.headlineMedium?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
          ),
        ),
        const SizedBox(height: 22),
        AnimatedFadeIn(
          delay: const Duration(milliseconds: 360),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Text(
              AppConstants.summary,
              style: theme.textTheme.bodyLarge,
              textAlign: isMobile ? TextAlign.center : TextAlign.left,
            ),
          ),
        ),
        const SizedBox(height: 36),
        AnimatedFadeIn(
          delay: const Duration(milliseconds: 440),
          child: Wrap(
            spacing: 14,
            runSpacing: 14,
            alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
            children: [
              CustomButton(
                label: "Let's Work Together",
                icon: Icons.arrow_forward_rounded,
                onTap: onContactTap,
              ),
              CustomButton(
                label: 'View Projects',
                icon: Icons.grid_view_rounded,
                style: ButtonStyleType.outline,
                onTap: onProjectsTap,
              ),
              CustomButton(
                label: 'Download CV',
                icon: Icons.download_rounded,
                style: ButtonStyleType.outline,
                onTap: () => CvService.downloadCv(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 36),
        AnimatedFadeIn(
          delay: const Duration(milliseconds: 520),
          child: Row(
            mainAxisAlignment:
            isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: const [
              _HoverSocial(
                icon: FontAwesomeIcons.github,
                url: AppConstants.github,
              ),
              SizedBox(width: 16),
              _HoverSocial(
                icon: FontAwesomeIcons.linkedin,
                url: AppConstants.linkedin,
              ),
              SizedBox(width: 16),
              _HoverSocial(
                icon: FontAwesomeIcons.whatsapp,     // NEW
                url: AppConstants.whatsapp,          // NEW
              ),
              SizedBox(width: 16),
              _HoverSocial(
                icon: FontAwesomeIcons.envelope,
                url: 'mailto:${AppConstants.email}',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar(BuildContext context) {
    final size = Responsive.isMobile(context)
        ? 220.0
        : (Responsive.isTablet(context) ? 280.0 : 340.0);

    return AnimatedFadeIn(
      delay: const Duration(milliseconds: 300),
      child: Center(
        child: SizedBox(
          width: size,
          height: size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Outer glow ring
              Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.primary.withOpacity(0.4),
                      AppColors.secondary.withOpacity(0.2),
                      AppColors.accent.withOpacity(0.4),
                    ],
                  ),
                ),
              ),
              // Inner dark ring
              Container(
                width: size - 12,
                height: size - 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.surface,
                  border: Border.all(color: AppColors.border, width: 1),
                ),
              ),
              // ─── PROFILE IMAGE (replaces "MJ" initials) ───
              Container(
                width: size - 60,
                height: size - 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.primary, AppColors.accent],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.5),
                      blurRadius: 40,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/profile.jpeg',
                    fit: BoxFit.cover,
                    width: size - 60,
                    height: size - 60,
                    // Fallback if the image fails to load
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Text(
                          'MJ',
                          style: TextStyle(
                            fontSize: size * 0.28,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            letterSpacing: 2,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // Flutter badge
              Positioned(
                bottom: 12,
                right: 12,
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: AppColors.primary, width: 1.4),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.3),
                        blurRadius: 14,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      FaIcon(FontAwesomeIcons.flutter,
                          color: AppColors.secondary, size: 16),
                      SizedBox(width: 8),
                      Text(
                        'Flutter Dev',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HoverSocial extends StatefulWidget {
  final FaIconData icon;
  final String url;
  const _HoverSocial({required this.icon, required this.url});

  @override
  State<_HoverSocial> createState() => _HoverSocialState();
}

class _HoverSocialState extends State<_HoverSocial> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(widget.url)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: _hovered ? AppColors.primary : AppColors.card,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _hovered ? AppColors.primary : AppColors.border,
            ),
            boxShadow: _hovered
                ? [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.4),
                blurRadius: 18,
              ),
            ]
                : [],
          ),
          alignment: Alignment.center,
          child: FaIcon(
            widget.icon,
            color: _hovered ? Colors.white : AppColors.textSecondary,
            size: 18,
          ),
        ),
      ),
    );
  }
}