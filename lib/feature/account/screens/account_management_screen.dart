import 'package:electricity_meter_app/constants/app_colors.dart';
import 'package:electricity_meter_app/constants/app_resources.dart';
import 'package:electricity_meter_app/core/blocs/auth/auth_bloc.dart';
import 'package:electricity_meter_app/general/routes/app_router.dart';
import 'package:electricity_meter_app/general/routes/route_paths.dart';
import 'package:electricity_meter_app/general/widgets/base_widget.dart';
import 'package:electricity_meter_app/general/widgets/buttons/app_button.dart';
import 'package:electricity_meter_app/general/widgets/buttons/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountManagementScreen extends StatelessWidget {
  const AccountManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(35)),
                  child: Image.asset(
                    AppImages.img_mascot_ball,
                    width: 70,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ngô Văn Huy",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textdark,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "huyngo@gmail.com",
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Image.asset(AppIcons.ic_circle_small),
                        const SizedBox(width: 5),
                        const Text("Chủ sân"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(AppIcons.ic_account_tab),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            "Thông tin cá nhân",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.textdark,
                            ),
                          ),
                        ),
                        Image.asset(AppIcons.ic_chevron_right),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Image.asset(AppIcons.ic_account_tab),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            "Tin nhắn",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.textdark,
                            ),
                          ),
                        ),
                        Image.asset(AppIcons.ic_chevron_right),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Image.asset(AppIcons.ic_account_tab),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            "Hồ sơ đăng ký",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.textdark,
                            ),
                          ),
                        ),
                        Image.asset(AppIcons.ic_chevron_right),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            AppButton(
              text: "Đăng xuất",
              onPress: () {
                context.read<AuthBloc>().add(LogoutRequested());
              },
            ),
          ],
        ),
      ),
    );
  }
}
