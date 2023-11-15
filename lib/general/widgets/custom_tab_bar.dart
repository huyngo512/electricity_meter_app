import 'package:electricity_meter_app/general/widgets/decoration_tab_bar.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    this.tabController,
    required this.tabs,
  });

  final TabController? tabController;
  final List<Tab> tabs;

  @override
  Widget build(BuildContext context) {
    return DecorationTabBar(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.grey.withOpacity(0.2),
            width: 2.0,
          ),
        ),
      ),
      tabBar: TabBar(
        controller: tabController,
        labelColor: AppColors.primaryturquoise,
        unselectedLabelColor: AppColors.grey,
        indicatorColor: AppColors.primaryturquoise,
        tabs: tabs,
      ),
    );
  }
}
