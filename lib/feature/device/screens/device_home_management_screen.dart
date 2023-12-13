import 'package:electricity_meter_app/constants/app_colors.dart';
import 'package:electricity_meter_app/constants/app_resources.dart';
import 'package:electricity_meter_app/feature/device/screens/pitch_info_screen.dart';
import 'package:electricity_meter_app/general/widgets/app_navigation_bar.dart';
import 'package:electricity_meter_app/general/widgets/base_widget.dart';
import 'package:electricity_meter_app/general/widgets/buttons/default_button.dart';
import 'package:electricity_meter_app/general/widgets/buttons/small_button.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class DeviceHomeManagementScreen extends StatelessWidget {
  const DeviceHomeManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 30),
            AppNavigationBar(
              leftItems: [
                Text(
                  "Vị trí của bạn",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textdark,
                  ),
                ),
              ],
              rightItems: [
                Material(
                  child: InkWell(
                    onTap: () {},
                    splashColor: AppColors.grey,
                    customBorder: const CircleBorder(),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(AppIcons.ic_bell),
                    ),
                  ),
                ),
                Material(
                  child: InkWell(
                    onTap: () {
                      showAddDeviceModal(context);
                    },
                    splashColor: AppColors.grey,
                    customBorder: const CircleBorder(),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ),
            //showNoDeviceWidget(context),
            Column(
              children: [
                showItem(context),
                showItem(context),
                showItem(context),
                showItem(context),
                showItem(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  showItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        child: InkWell(
          onTap: () {
            pushNewScreen(
              context,
              screen: const PitchInfoScreen(),
              withNavBar: false,
            );
          },
          splashColor: AppColors.grey.withOpacity(0.1),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
              child: Row(
                children: [
                  Image.asset(
                    AppImages.img_login_center,
                    width: 100,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sân bóng Hoàng Cầu",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                            "Địa chỉ: 69 Hoàng Cầu, Ô Chợ Dừa, Đống Đa, Hà Nội")
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  showAddDeviceModal(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.location_city),
                    const SizedBox(width: 8),
                    Text(
                      "Tìm kiếm theo khu vực",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textdark,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.edit_location),
                    const SizedBox(width: 8),
                    Text(
                      "Thanh tìm kiếm",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textdark,
                      ),
                    ),
                  ],
                ),
              ),
              DefaultButton(
                text: "Hủy bỏ",
                onPress: () {},
              ),
            ],
          ),
        );
      },
    );
  }

  showNoDeviceWidget(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.centerRight,
            child: Image.asset(AppImages.img_curved_arrow),
          ),
        ),
        const SizedBox(height: 20),
        Image.asset(AppImages.img_robot),
        const SizedBox(height: 43),
        Text(
          "Chưa có thiết bị được thêm vào",
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textdark,
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Text(
            """Bạn vui lòng nhấn nút “+” ở góc trên hoặc nút "Thêm thiết bị” dưới đây để bắt đầu.""",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SmallButton(
          text: "Thêm thiết bị",
          onPress: () {
            showAddDeviceModal(context);
          },
        ),
      ],
    );
  }

  showLeftAppBarWidget(BuildContext context) {
    return [
      FocusedMenuHolder(
        onPressed: () {},
        menuBoxDecoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        openWithTap: true,
        menuWidth: MediaQuery.of(context).size.width * 0.42,
        //blurSize: 5.0,
        //menuItemExtent: 45,
        animateMenuItems: true,
        blurBackgroundColor: Colors.black54,
        menuOffset: 10.0,
        //bottomOffsetHeight: 80.0,
        menuItems: <FocusedMenuItem>[
          FocusedMenuItem(
              title: Text("Open"),
              trailingIcon: Icon(Icons.open_in_new),
              onPressed: () {}),
          FocusedMenuItem(
              title: Text("Share"),
              trailingIcon: Icon(Icons.share),
              onPressed: () {}),
          FocusedMenuItem(
              title: Text("Favorite"),
              trailingIcon: Icon(Icons.favorite_border),
              onPressed: () {}),
          FocusedMenuItem(
              title: Text(
                "Delete",
                style: TextStyle(color: Colors.redAccent),
              ),
              trailingIcon: Icon(
                Icons.delete,
                color: Colors.redAccent,
              ),
              onPressed: () {}),
        ],
        child: Row(
          children: [
            Text(
              "Vũ Quang Home",
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.grey,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.shadebackground,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(AppIcons.ic_caret_down),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  showHasDeviceWidget() {
    return Column(
      children: [],
    );
  }
}
