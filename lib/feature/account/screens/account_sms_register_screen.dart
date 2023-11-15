import 'package:electricity_meter_app/constants/app_colors.dart';
import 'package:electricity_meter_app/constants/app_resources.dart';
import 'package:electricity_meter_app/general/widgets/app_navigation_bar.dart';
import 'package:electricity_meter_app/general/widgets/base_widget.dart';
import 'package:electricity_meter_app/general/widgets/buttons/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AccountSmsRegisterScreen extends StatefulWidget {
  const AccountSmsRegisterScreen({super.key});

  @override
  State<AccountSmsRegisterScreen> createState() =>
      _AccountSmsRegisterScreenState();
}

class _AccountSmsRegisterScreenState extends State<AccountSmsRegisterScreen> {
  late TextEditingController _otpController;

  @override
  void initState() {
    _otpController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            left: 36,
            right: 37,
          ),
          child: Column(
            children: [
              AppNavigationBar(
                leftItems: [
                  Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      splashColor: AppColors.grey,
                      customBorder: const CircleBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset(AppIcons.ic_chevron_left),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 120),
              Text(
                "Nhập OTP",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                "Vui lòng nhập mã OTP. Mã OTP sẽ được gửi tới số điện thoại của bạn đã đăng ký.",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 24),
              PinCodeTextField(
                appContext: context,
                length: 6,
                enableActiveFill: true,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  borderWidth: 1,
                  fieldWidth: 46,
                  fieldHeight: 60,
                  selectedFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  activeFillColor: Colors.white,
                  activeColor: AppColors.primaryturquoise,
                  inactiveColor: Colors.white,
                  activeBorderWidth: 1,
                ),
              ),
              const SizedBox(height: 24),
              SubmitButton(
                text: "Tạo tài khoản",
                onPress: () {},
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        "Bằng việc nhấn tiếp theo tôi đồng ý với chính sách về ",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryblue,
                    ),
                    children: [
                      TextSpan(
                        text: "quyền riêng tư thỏa thuận người dùng",
                        style: GoogleFonts.inter(
                          color: AppColors.primaryturquoise,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
