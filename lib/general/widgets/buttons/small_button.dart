import 'package:electricity_meter_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallButton extends StatelessWidget {
  const SmallButton({
    super.key,
    required this.onPress,
    required this.text,
    this.backgroundColor,
  });

  final VoidCallback onPress;
  final String text;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.primaryturquoise,
        shadowColor: const Color.fromRGBO(16, 24, 40, 0.05),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: backgroundColor == null
                ? AppColors.primaryturquoise
                : AppColors.grey,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 16,
            color: backgroundColor == null ? Colors.white : AppColors.grey700,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
