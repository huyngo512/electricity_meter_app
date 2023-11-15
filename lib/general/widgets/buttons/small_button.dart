import 'package:electricity_meter_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallButton extends StatelessWidget {
  const SmallButton({
    super.key,
    required this.onPress,
    required this.text,
  });

  final VoidCallback onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryturquoise,
        shadowColor: const Color.fromRGBO(16, 24, 40, 0.05),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: AppColors.primaryturquoise,
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
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
