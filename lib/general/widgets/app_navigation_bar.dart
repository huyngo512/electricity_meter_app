import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    super.key,
    this.leftItems,
    this.title,
    this.rightItems,
  });

  final List<Widget>? leftItems;
  final String? title;
  final List<Widget>? rightItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (leftItems != null)
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: leftItems!,
              ),
            ),
          ),
        if (title != null)
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                title!,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        if (rightItems != null)
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: rightItems!,
              ),
            ),
          ),
      ],
    );
  }
}
