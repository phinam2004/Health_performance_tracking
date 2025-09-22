import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final double? borderRadius;
  final VoidCallback? onTap;

  const CustomCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderRadius,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          margin ??
          const EdgeInsets.symmetric(
            horizontal: AppSizes.paddingMedium,
            vertical: AppSizes.paddingSmall,
          ),
      child: Material(
        color: backgroundColor ?? AppColors.cardBackground,
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppSizes.radiusLarge,
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(
            borderRadius ?? AppSizes.radiusLarge,
          ),
          child: Container(
            padding: padding ?? const EdgeInsets.all(AppSizes.paddingMedium),
            child: child,
          ),
        ),
      ),
    );
  }
}

class MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final String? subtitle;
  final IconData? icon;
  final Color? iconColor;
  final Widget? trailing;
  final VoidCallback? onTap;

  const MetricCard({
    super.key,
    required this.title,
    required this.value,
    this.subtitle,
    this.icon,
    this.iconColor,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  color: iconColor ?? AppColors.textSecondary,
                  size: AppSizes.iconMedium,
                ),
                const SizedBox(width: AppSizes.paddingSmall),
              ],
              Expanded(child: Text(title, style: AppTextStyles.bodyLarge)),
              if (trailing != null) trailing!,
            ],
          ),
          const SizedBox(height: AppSizes.paddingSmall),
          Text(
            value,
            style: AppTextStyles.headlineMedium.copyWith(
              color: AppColors.primary,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: AppSizes.paddingSmall),
            Text(subtitle!, style: AppTextStyles.bodySmall),
          ],
        ],
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  final double progress;
  final double height;
  final Color? backgroundColor;
  final Color? progressColor;
  final BorderRadius? borderRadius;

  const ProgressBar({
    super.key,
    required this.progress,
    this.height = 8.0,
    this.backgroundColor,
    this.progressColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.divider,
        borderRadius:
            borderRadius ?? BorderRadius.circular(AppSizes.radiusSmall),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress.clamp(0.0, 1.0),
        child: Container(
          decoration: BoxDecoration(
            color: progressColor ?? AppColors.primary,
            borderRadius:
                borderRadius ?? BorderRadius.circular(AppSizes.radiusSmall),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsets? padding;
  final double? borderRadius;
  final bool isOutlined;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.padding,
    this.borderRadius,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isOutlined
            ? Colors.transparent
            : backgroundColor ?? AppColors.primary,
        foregroundColor:
            textColor ??
            (isOutlined ? AppColors.textPrimary : AppColors.background),
        side: isOutlined
            ? BorderSide(color: backgroundColor ?? AppColors.textPrimary)
            : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadius ?? AppSizes.radiusMedium,
          ),
        ),
        padding:
            padding ??
            const EdgeInsets.symmetric(
              horizontal: AppSizes.paddingLarge,
              vertical: AppSizes.paddingMedium,
            ),
      ),
      child: Text(text),
    );
  }
}
