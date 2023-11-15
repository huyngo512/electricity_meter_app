import 'package:electricity_meter_app/constants/app_colors.dart';
import 'package:electricity_meter_app/constants/app_resources.dart';
import 'package:electricity_meter_app/general/widgets/base_widget.dart';
import 'package:electricity_meter_app/general/widgets/buttons/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SmsLoginScreen extends StatefulWidget {
  const SmsLoginScreen({super.key});

  @override
  State<SmsLoginScreen> createState() => _SmsLoginScreenState();
}

class _SmsLoginScreenState extends State<SmsLoginScreen> {
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
              Image.asset(AppImages.img_login),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  "Đăng nhập bằng số điện thoại",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
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
                text: "Đăng nhập",
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
