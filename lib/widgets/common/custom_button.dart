import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

enum ButtonStyleType { primary, outline, ghost }

class CustomButton extends StatefulWidget {
  final String label;
  final IconData? icon;
  final VoidCallback onTap;
  final ButtonStyleType style;
  final bool expanded;

  const CustomButton({
    super.key,
    required this.label,
    required this.onTap,
    this.icon,
    this.style = ButtonStyleType.primary,
    this.expanded = false,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isPrimary = widget.style == ButtonStyleType.primary;
    final isOutline = widget.style == ButtonStyleType.outline;

    final bgColor = isPrimary
        ? (_hovered ? AppColors.primary.withOpacity(0.9) : AppColors.primary)
        : isOutline
        ? (_hovered ? AppColors.primary.withOpacity(0.12) : Colors.transparent)
        : Colors.transparent;

    final borderColor = isPrimary
        ? Colors.transparent
        : (_hovered ? AppColors.primary : AppColors.border);

    final textColor = isPrimary
        ? Colors.white
        : (_hovered ? AppColors.primary : AppColors.textPrimary);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 15),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor, width: 1.4),
            boxShadow: isPrimary && _hovered
                ? [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.35),
                blurRadius: 22,
                offset: const Offset(0, 8),
              ),
            ]
                : [],
          ),
          transform: Matrix4.translationValues(0, _hovered ? -2 : 0, 0),
          child: Row(
            mainAxisSize: widget.expanded ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon, size: 18, color: textColor),
                const SizedBox(width: 10),
              ],
              Text(
                widget.label,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}