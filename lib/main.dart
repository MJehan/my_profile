import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'sections/about_section.dart';
import 'sections/contact_section.dart';
import 'sections/education_section.dart';
import 'sections/experience_section.dart';
import 'sections/hero_section.dart';
import 'sections/projects_section.dart';
import 'sections/skills_section.dart';
import 'theme/app_theme.dart';
import 'utils/responsive.dart';
import 'widgets/footer.dart';
import 'widgets/navbar.dart';

void main() {
  debugPaintSizeEnabled = false; // keep false in production
  runApp(const JehanPortfolioApp());
}

class JehanPortfolioApp extends StatelessWidget {
  const JehanPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MD Jehan — Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const PortfolioHome(),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        scrollbars: false,
      ),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<NavBarState> _navKey = GlobalKey<NavBarState>();
  bool _showMobileMenu = false;

  final Map<String, GlobalKey> _sectionKeys = {
    'home': GlobalKey(),
    'about': GlobalKey(),
    'experience': GlobalKey(),
    'projects': GlobalKey(),
    'skills': GlobalKey(),
    'education': GlobalKey(),
    'contact': GlobalKey(),
  };

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(String id) {
    final key = _sectionKeys[id];
    if (key?.currentContext != null) {
      final RenderObject? renderObj = key!.currentContext!.findRenderObject();
      if (renderObj is RenderBox) {
        final position = renderObj.localToGlobal(Offset.zero);
        final target = position.dy + _scrollController.offset - 70;
        _scrollController.animateTo(
          target.clamp(0.0, _scrollController.position.maxScrollExtent),
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOutCubic,
        );
      }
    }
  }

  void _toggleMobileMenu() {
    setState(() => _showMobileMenu = !_showMobileMenu);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            NotificationListener<ScrollNotification>(
              onNotification: (n) {
                // Close mobile menu on scroll
                if (_showMobileMenu && n.metrics.pixels > 10) {
                  setState(() => _showMobileMenu = false);
                }
                return false;
              },
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    // NavBar placeholder height so hero isn't hidden under sticky bar
                    SizedBox(
                      height: Responsive.isMobile(context) ? 78 : 86,
                    ),
                    Container(
                      key: _sectionKeys['home'],
                      child: HeroSection(
                        onContactTap: () => _scrollToSection('contact'),
                        onProjectsTap: () => _scrollToSection('projects'),
                      ),
                    ),
                    Container(
                      key: _sectionKeys['about'],
                      child: const AboutSection(),
                    ),
                    Container(
                      key: _sectionKeys['experience'],
                      child: const ExperienceSection(),
                    ),
                    Container(
                      key: _sectionKeys['projects'],
                      child: const ProjectsSection(),
                    ),
                    Container(
                      key: _sectionKeys['skills'],
                      child: const SkillsSection(),
                    ),
                    Container(
                      key: _sectionKeys['education'],
                      child: const EducationSection(),
                    ),
                    Container(
                      key: _sectionKeys['contact'],
                      child: const ContactSection(),
                    ),
                    const Footer(),
                  ],
                ),
              ),
            ),
            // Sticky NavBar
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  NavBar(
                    key: _navKey,
                    onNavTap: (id) {
                      _scrollToSection(id);
                      if (_showMobileMenu) {
                        setState(() => _showMobileMenu = false);
                      }
                    },
                  ),
                ],
              ),
            ),
            // Mobile menu overlay – hooking to NavBar's internal state via toggle:
            // Simplified: render a mobile menu under the navbar if needed.
            if (Responsive.isMobile(context))
              Positioned(
                top: 78,
                left: 0,
                right: 0,
                child: _MobileMenuButtonHandler(
                  navKey: _navKey,
                  onNavTap: _scrollToSection,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// A tiny helper widget that listens to the NavBar's internal hamburger state.
/// Instead of duplicating state, we expose the mobile menu directly from the
/// NavBar via its own state management. For simplicity we keep a dedicated
/// mobile drawer here.

class _MobileMenuButtonHandler extends StatelessWidget {
  final GlobalKey<NavBarState> navKey;
  final Function(String) onNavTap;

  const _MobileMenuButtonHandler({
    required this.navKey,
    required this.onNavTap,
  });

  @override
  Widget build(BuildContext context) {
    // The NavBar itself handles opening/closing. This placeholder prevents
    // duplicate overlays; the actual menu is rendered inside NavBar via
    // rebuild when its hamburger is tapped.
    return const SizedBox.shrink();
  }
}