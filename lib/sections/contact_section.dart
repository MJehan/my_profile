import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../utils/constants.dart';
import '../utils/responsive.dart';
import '../widgets/common/animated_fade_in.dart';
import '../widgets/common/custom_button.dart';
import '../widgets/common/section_title.dart';
import '../utils/cv_service.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
              eyebrow: 'Get In Touch',
              title: "Let's Build Something\nGreat Together",
              subtitle:
              'I am open to freelance projects, full-time opportunities and '
                  'collaborations. Drop a message — I typically reply within a day.',
            ),
          ),
          const SizedBox(height: 50),

          // ─── First row: Email + Phone (+ WhatsApp on mobile) ───
          AnimatedFadeIn(
            delay: const Duration(milliseconds: 150),
            child: isMobile
                ? Column(
              children: [
                _ContactCard(
                  icon: const Icon(
                    Icons.email_rounded,
                    color: AppColors.primary,
                    size: 22,
                  ),
                  label: 'Email',
                  value: AppConstants.email,
                  color: AppColors.primary,
                  onTap: () => launchUrl(
                      Uri.parse('mailto:${AppConstants.email}')),
                ),
                const SizedBox(height: 16),
                _ContactCard(
                  icon: const Icon(
                    Icons.phone_rounded,
                    color: AppColors.secondary,
                    size: 22,
                  ),
                  label: 'Phone',
                  value: AppConstants.phone,
                  color: AppColors.secondary,
                  onTap: () =>
                      launchUrl(Uri.parse('tel:${AppConstants.phone}')),
                  onCopy: () {
                    Clipboard.setData(
                        ClipboardData(text: AppConstants.phone));
                  },
                ),
                const SizedBox(height: 16),
                _ContactCard(
                  icon: const FaIcon(
                    FontAwesomeIcons.whatsapp,
                    color: Color(0xFF25D366),
                    size: 20,
                  ),
                  label: 'WhatsApp',
                  value: AppConstants.whatsappDisplay,
                  color: const Color(0xFF25D366),
                  onTap: () =>
                      launchUrl(Uri.parse(AppConstants.whatsapp)),
                ),
                const SizedBox(height: 16),
                _ContactCard(
                  icon: const FaIcon(
                    FontAwesomeIcons.github,
                    color: Color(0xFF9D4EDD),
                    size: 20,
                  ),
                  label: 'GitHub',
                  value: 'github.com/MJehan',
                  color: const Color(0xFF9D4EDD),
                  onTap: () => launchUrl(Uri.parse(AppConstants.github)),
                ),
                const SizedBox(height: 16),
                _ContactCard(
                  icon: const FaIcon(
                    FontAwesomeIcons.linkedin,
                    color: Color(0xFF0A66C2),
                    size: 20,
                  ),
                  label: 'LinkedIn',
                  value: 'in/m-jehan-2122ba159',
                  color: const Color(0xFF0A66C2),
                  onTap: () =>
                      launchUrl(Uri.parse(AppConstants.linkedin)),
                ),
              ],
            )
                : Row(
              children: [
                Expanded(
                  child: _ContactCard(
                    icon: const Icon(
                      Icons.email_rounded,
                      color: AppColors.primary,
                      size: 22,
                    ),
                    label: 'Email',
                    value: AppConstants.email,
                    color: AppColors.primary,
                    onTap: () => launchUrl(
                        Uri.parse('mailto:${AppConstants.email}')),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _ContactCard(
                    icon: const Icon(
                      Icons.phone_rounded,
                      color: AppColors.secondary,
                      size: 22,
                    ),
                    label: 'Phone',
                    value: AppConstants.phone,
                    color: AppColors.secondary,
                    onTap: () => launchUrl(
                        Uri.parse('tel:${AppConstants.phone}')),
                    onCopy: () {
                      Clipboard.setData(
                          ClipboardData(text: AppConstants.phone));
                    },
                  ),
                ),
              ],
            ),
          ),

          // ─── Second row on desktop: WhatsApp + GitHub + LinkedIn ───
          if (!isMobile) const SizedBox(height: 16),
          if (!isMobile)
            AnimatedFadeIn(
              delay: const Duration(milliseconds: 220),
              child: Row(
                children: [
                  Expanded(
                    child: _ContactCard(
                      icon: const FaIcon(
                        FontAwesomeIcons.whatsapp,
                        color: Color(0xFF25D366),
                        size: 20,
                      ),
                      label: 'WhatsApp',
                      value: AppConstants.whatsappDisplay,
                      color: const Color(0xFF25D366),
                      onTap: () =>
                          launchUrl(Uri.parse(AppConstants.whatsapp)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _ContactCard(
                      icon: const FaIcon(
                        FontAwesomeIcons.github,
                        color: Color(0xFF9D4EDD),
                        size: 20,
                      ),
                      label: 'GitHub',
                      value: 'github.com/MJehan',
                      color: const Color(0xFF9D4EDD),
                      onTap: () => launchUrl(Uri.parse(AppConstants.github)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _ContactCard(
                      icon: const FaIcon(
                        FontAwesomeIcons.linkedin,
                        color: Color(0xFF0A66C2),
                        size: 20,
                      ),
                      label: 'LinkedIn',
                      value: 'in/m-jehan-2122ba159',
                      color: const Color(0xFF0A66C2),
                      onTap: () =>
                          launchUrl(Uri.parse(AppConstants.linkedin)),
                    ),
                  ),
                ],
              ),
            ),

          const SizedBox(height: 40),

          // ─── CTA banner ───
          AnimatedFadeIn(
            delay: const Duration(milliseconds: 320),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(34),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primary.withOpacity(0.18),
                    AppColors.accent.withOpacity(0.12),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.primary.withOpacity(0.35)),
              ),
              child: Column(
                children: [
                  const Text(
                    'Ready to start a project?',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Let\'s discuss how I can help bring your mobile app idea to life.',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14.5,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 14,
                    runSpacing: 12,
                    alignment: WrapAlignment.center,
                    children: [
                      CustomButton(
                        label: "Let's Work Together",
                        icon: Icons.rocket_launch_rounded,
                        onTap: () => launchUrl(
                            Uri.parse('mailto:${AppConstants.email}')),
                      ),
                      CustomButton(
                        label: 'WhatsApp',
                        icon: Icons.chat_rounded,
                        onTap: () =>
                            launchUrl(Uri.parse(AppConstants.whatsapp)),
                      ),
                      CustomButton(
                        label: 'Download CV',
                        icon: Icons.download_rounded,
                        style: ButtonStyleType.outline,
                        onTap: () => CvService.downloadCv(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatefulWidget {
  final Widget icon;
  final String label;
  final String value;
  final Color color;
  final VoidCallback onTap;
  final VoidCallback? onCopy;

  const _ContactCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    required this.onTap,
    this.onCopy,
  });

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          transform: Matrix4.translationValues(0, _hovered ? -4 : 0, 0),
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: _hovered ? widget.color : AppColors.border,
            ),
            boxShadow: _hovered
                ? [
              BoxShadow(
                color: widget.color.withOpacity(0.25),
                blurRadius: 24,
                offset: const Offset(0, 10),
              ),
            ]
                : [],
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: widget.color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: widget.color.withOpacity(0.4)),
                ),
                alignment: Alignment.center,
                child: widget.icon,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.label,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      widget.value,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14.5,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              if (widget.onCopy != null)
                IconButton(
                  icon: const Icon(Icons.copy_rounded,
                      color: AppColors.textSecondary, size: 18),
                  tooltip: 'Copy phone number',
                  onPressed: widget.onCopy,
                )
              else
                Icon(
                  Icons.arrow_outward_rounded,
                  color: _hovered ? widget.color : AppColors.textSecondary,
                  size: 18,
                ),
            ],
          ),
        ),
      ),
    );
  }
}