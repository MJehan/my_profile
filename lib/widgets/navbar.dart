import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../utils/constants.dart';
import '../utils/responsive.dart';
import '../utils/cv_service.dart';

class NavBar extends StatefulWidget {
  final Function(String) onNavTap;
  const NavBar({super.key, required this.onNavTap});

  @override
  State<NavBar> createState() => NavBarState();
}

// Public state class so it can be typed externally if needed.
class NavBarState extends State<NavBar> {
  bool _scrolled = false;
  String _active = 'home';
  bool _menuOpen = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return NotificationListener<ScrollNotification>(
      onNotification: (n) {
        if (n.metrics.pixels > 40 && !_scrolled) {
          setState(() => _scrolled = true);
        } else if (n.metrics.pixels <= 40 && _scrolled) {
          setState(() => _scrolled = false);
        }
        return false;
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // --- Top bar ---
          AnimatedContainer(
            duration: const Duration(milliseconds: 260),
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.horizontalPadding(context),
              vertical: _scrolled ? 14 : 22,
            ),
            decoration: BoxDecoration(
              color: _scrolled
                  ? AppColors.background.withOpacity(0.92)
                  : AppColors.background.withOpacity(0.75),
              border: Border(
                bottom: BorderSide(
                  color: _scrolled ? AppColors.border : Colors.transparent,
                ),
              ),
              boxShadow: _scrolled
                  ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ]
                  : [],
            ),
            child: Row(
              children: [
                // Logo
                GestureDetector(
                  onTap: () => _navTo('home'),
                  child: Row(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppColors.primary, AppColors.accent],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'MJ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      if (!isMobile)
                        const Text(
                          'MD JEHAN',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            letterSpacing: 0.5,
                          ),
                        ),
                    ],
                  ),
                ),
                const Spacer(),
                if (!isMobile)
                  Row(
                    children: AppConstants.navItems.map((item) {
                      return _NavLink(
                        label: item.label,
                        active: _active == item.id,
                        onTap: () => _navTo(item.id),
                      );
                    }).toList(),
                  ),
                if (!isMobile) ...[
                  const SizedBox(width: 16),
                  _buildDownloadCvButton(),
                  const SizedBox(width: 12),
                  _buildHireButton(),
                ],
                if (isMobile)
                  IconButton(
                    icon: Icon(
                      _menuOpen ? Icons.close : Icons.menu,
                      color: AppColors.textPrimary,
                    ),
                    onPressed: () => setState(() => _menuOpen = !_menuOpen),
                  ),
              ],
            ),
          ),

          // --- Mobile dropdown menu ---
          if (isMobile)
            AnimatedSize(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              child: _menuOpen
                  ? Container(
                width: double.infinity,
                color: AppColors.surface,
                padding: const EdgeInsets.symmetric(
                    vertical: 16, horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- Nav links ---
                    ...AppConstants.navItems.map((item) {
                      return InkWell(
                        onTap: () => _navTo(item.id),
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 14),
                          child: Text(
                            item.label,
                            style: TextStyle(
                              color: _active == item.id
                                  ? AppColors.primary
                                  : AppColors.textPrimary,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    }),

                    // --- Download CV entry (NEW) ---
                    InkWell(
                      onTap: () {
                        CvService.downloadCv();
                        setState(() => _menuOpen = false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.download_rounded,
                              color: AppColors.primary,
                              size: 18,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Download CV',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // --- Social icons ---
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => launchUrl(
                              Uri.parse(AppConstants.github)),
                          icon: const FaIcon(
                            FontAwesomeIcons.github,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        IconButton(
                          onPressed: () => launchUrl(
                              Uri.parse(AppConstants.linkedin)),
                          icon: const FaIcon(
                            FontAwesomeIcons.linkedin,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        IconButton(
                          onPressed: () => launchUrl(Uri.parse(AppConstants.whatsapp)), // NEW
                          icon: const FaIcon(                                            // NEW
                            FontAwesomeIcons.whatsapp,                                   // NEW
                            color: Color(0xFF25D366),                                    // NEW
                          ),                                                             // NEW
                        ),
                      ],
                    ),
                  ],
                ),
              )
                  : const SizedBox.shrink(),
            ),
        ],
      ),
    );
  }

  Widget _buildHireButton() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _navTo('contact'),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primary, AppColors.accent],
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.3),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: const Text(
            'Hire Me',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDownloadCvButton() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => CvService.downloadCv(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border, width: 1.4),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.download_rounded,
                  color: AppColors.textPrimary, size: 16),
              SizedBox(width: 8),
              Text(
                'Download CV',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navTo(String id) {
    setState(() {
      _active = id;
      _menuOpen = false;
    });
    widget.onNavTap(id);
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _NavLink({
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final highlight = widget.active || _hovered;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  color: highlight
                      ? AppColors.textPrimary
                      : AppColors.textSecondary,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                child: Text(widget.label),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: highlight ? 20 : 0,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.secondary],
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}