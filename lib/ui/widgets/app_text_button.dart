import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/core/constants/colors.dart';
import 'package:owwn_coding_challenge/ui/widgets/app_text.dart';

class AppTextButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  final Color fgColor;
  final Color bgColor;

  const AppTextButton({
    super.key,
    required this.label,
    this.onPressed,
    this.fgColor = AppColors.white,
    this.bgColor = AppColors.tileBg,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
        backgroundColor: bgColor,
        foregroundColor: fgColor,
      ),
      onPressed: onPressed,
      child: AppText(
        label,
        fontSize: 18,
        weight: FontWeight.w400,
        color: fgColor,
      ),
    );
  }
}
