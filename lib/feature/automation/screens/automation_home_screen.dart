import 'package:electricity_meter_app/constants/app_colors.dart';
import 'package:electricity_meter_app/constants/app_resources.dart';
import 'package:electricity_meter_app/general/widgets/app_navigation_bar.dart';
import 'package:electricity_meter_app/general/widgets/base_widget.dart';
import 'package:electricity_meter_app/general/widgets/buttons/small_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AutomationHomeScreen extends StatelessWidget {
  const AutomationHomeScreen({super.key});

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
                  "Sân của tôi",
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
                      child: Image.asset(AppIcons.ic_plus),
                    ),
                  ),
                ),
              ],
            ),
            showNoDeviceWidget(context)
          ],
        ),
      ),
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
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Image.asset(AppImages.img_mascot_ball),
        ),
        const SizedBox(height: 43),
        Text(
          "Bạn chưa đăng ký sân bóng nào",
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
            """Bạn vui lòng nhấn nút “+” ở góc trên hoặc nút "Đăng ký sân” dưới đây để bắt đầu.""",
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
          text: "Đăng ký sân",
          onPress: () {},
        ),
      ],
    );
  }
}
