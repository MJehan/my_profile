import 'package:flutter/material.dart';

class AppConstants {
  static const String name = 'MD JEHAN';
  static const String role = 'Flutter App Developer';
  static const String email = 'ewu.jehan@gmail.com';
  static const String phone = '01762350424';
  static const String github = 'https://github.com/MJehan';
  static const String linkedin = 'https://www.linkedin.com/in/m-jehan-2122ba159/';

  // NEW — WhatsApp deep link (opens in WhatsApp app or web)
  static const String whatsapp = 'https://wa.me/8801762350424';
  static const String whatsappDisplay = '+8801762350424';

  static const String summary =
      'Experienced Flutter Developer with over 4 years of hands-on expertise building '
      'production-ready cross-platform mobile applications. I specialize in crafting '
      'scalable, high-performance apps with clean architecture — from travel and '
      'e-commerce platforms to fintech and location-tracking solutions. Passionate about '
      'delivering polished user experiences and writing maintainable Dart code.';

  static const List<NavItem> navItems = [
    NavItem('Home', 'home'),
    NavItem('About', 'about'),
    NavItem('Experience', 'experience'),
    NavItem('Projects', 'projects'),
    NavItem('Skills', 'skills'),
    NavItem('Education', 'education'),
    NavItem('Contact', 'contact'),
  ];
}

class NavItem {
  final String label;
  final String id;
  const NavItem(this.label, this.id);
}