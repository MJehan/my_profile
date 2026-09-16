import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../utils/constants.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 16,
        runSpacing: 12,
        children: [
          Text(
            '© ${DateTime.now().year} MD Jehan. All rights reserved.',
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _socialIcon(FontAwesomeIcons.github, AppConstants.github),
              const SizedBox(width: 14),
              _socialIcon(FontAwesomeIcons.linkedin, AppConstants.linkedin),
              const SizedBox(width: 14),
              _socialIcon(FontAwesomeIcons.whatsapp, AppConstants.whatsapp), // NEW
              const SizedBox(width: 14),
              _socialIcon(
                FontAwesomeIcons.envelope,
                'mailto:${AppConstants.email}',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _socialIcon(FaIconData icon, String url) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      child: FaIcon(
        icon,
        color: AppColors.textSecondary,
        size: 18,
      ),
    );
  }
}