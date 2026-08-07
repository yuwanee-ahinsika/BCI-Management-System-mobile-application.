import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Single Responsibility: Reusable section header title with visual accent bar (SRP).
class SectionHeader extends StatelessWidget {
  final String title;
  final Gradient? gradient;

  const SectionHeader({
    super.key,
    required this.title,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 20,
          decoration: BoxDecoration(
            gradient: gradient ?? AppTheme.accentGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.3,
          ),
        ),
      ],
    );
  }
}
