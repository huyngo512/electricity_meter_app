import 'package:electricity_meter_app/constants/app_colors.dart';
import 'package:electricity_meter_app/constants/app_resources.dart';
import 'package:electricity_meter_app/feature/account/screens/account_management_screen.dart';
import 'package:electricity_meter_app/feature/automation/screens/automation_home_screen.dart';
import 'package:electricity_meter_app/feature/device/screens/device_home_management_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late PersistentTabController _controller;
  bool _hideNavBar = false;
  final NavBarStyle _navBarStyle = NavBarStyle.simple;
  final bool _hideNavigationBarWhenKeyboardShows = true;
  final bool _resizeToAvoidBottomInset = true;
  final bool _stateManagement = true;
  final bool _handleAndroidBackButtonPress = true;
  final bool _popAllScreensOnTapOfSelectedTab = true;
  final bool _confineInSafeArea = true;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  List<Widget> _buildScreens() {
    return [
      const DeviceHomeManagementScreen(),
      const AutomationHomeScreen(),
      const AccountManagementScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset(
          AppIcons.ic_active_home_tab,
          gaplessPlayback: true,
        ),
        inactiveIcon: Image.asset(
          AppIcons.ic_home_tab,
          gaplessPlayback: true,
        ),
        title: "Trang chủ",
        activeColorPrimary: AppColors.primaryturquoise,
        inactiveColorPrimary: AppColors.grey,
        routeAndNavigatorSettings: const RouteAndNavigatorSettings(
          initialRoute: '/device',
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          AppIcons.ic_active_auto_tab,
          gaplessPlayback: true,
        ),
        inactiveIcon: Image.asset(
          AppIcons.ic_auto_tab,
          gaplessPlayback: true,
        ),
        title: "Sân của tôi",
        activeColorPrimary: AppColors.primaryturquoise,
        inactiveColorPrimary: AppColors.grey,
        routeAndNavigatorSettings: const RouteAndNavigatorSettings(
          initialRoute: '/auto',
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          AppIcons.ic_active_account_tab,
          gaplessPlayback: true,
        ),
        inactiveIcon: Image.asset(
          AppIcons.ic_account_tab,
          gaplessPlayback: true,
        ),
        title: "Tài khoản",
        activeColorPrimary: AppColors.primaryturquoise,
        inactiveColorPrimary: AppColors.grey,
        routeAndNavigatorSettings: const RouteAndNavigatorSettings(
          initialRoute: '/account',
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: _confineInSafeArea,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: _handleAndroidBackButtonPress,
        resizeToAvoidBottomInset: _resizeToAvoidBottomInset,
        stateManagement: _stateManagement,
        navBarHeight: kBottomNavigationBarHeight + 10,
        hideNavigationBarWhenKeyboardShows: _hideNavigationBarWhenKeyboardShows,
        margin: EdgeInsets.zero,
        popActionScreens: PopActionScreensType.all,
        bottomScreenMargin: 0.0,
        onWillPop: (context) async {
          await showDialog(
            context: context!,
            useSafeArea: true,
            builder: (context) => Container(
              height: 50.0,
              width: 50.0,
              color: Colors.white,
              child: ElevatedButton(
                child: const Text("Close"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          );
          return false;
        },
        hideNavigationBar: _hideNavBar,
        decoration: NavBarDecoration(
          colorBehindNavBar: Colors.indigo,
          borderRadius: BorderRadius.circular(20.0),
        ),
        popAllScreensOnTapOfSelectedTab: _popAllScreensOnTapOfSelectedTab,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: _navBarStyle,
      ),
    );
  }
}
