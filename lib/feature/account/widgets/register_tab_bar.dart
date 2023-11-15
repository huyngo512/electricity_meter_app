import 'package:electricity_meter_app/general/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterTabBar extends StatelessWidget {
  const RegisterTabBar({super.key, required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return CustomTabBar(
      tabController: tabController,
      tabs: [
        Tab(
          child: Text(
            "Email",
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Tab(
          child: Text(
            "Số điện thoại",
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
