import 'package:electricity_meter_app/constants/app_colors.dart';
import 'package:electricity_meter_app/constants/app_resources.dart';
import 'package:electricity_meter_app/feature/auth/widgets/login_tab_bar.dart';
import 'package:electricity_meter_app/general/routes/route_paths.dart';
import 'package:electricity_meter_app/general/widgets/base_widget.dart';
import 'package:electricity_meter_app/general/widgets/buttons/app_button.dart';
import 'package:electricity_meter_app/general/widgets/buttons/submit_button.dart';
import 'package:electricity_meter_app/general/widgets/default_text_input.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _phoneNumberController;
  final _emailFormKey = GlobalKey<FormState>();
  final _phoneFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
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
              Text(
                "Đăng nhập",
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                "Tham gia ngay để trải nghiệm sản phẩm công tơ điện tử để quản lý tiêu thụ điện thông minh.",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 24),
              LoginTabBar(tabController: _tabController),
              SizedBox(
                height: 400,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Column(
                      children: [
                        Form(
                          key: _emailFormKey,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              DefaultTextInput(
                                controller: _emailController,
                                label: "Nhập địa chỉ email",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Thông tin không hợp lệ";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              DefaultTextInput(
                                controller: _passwordController,
                                label: "Mật khẩu",
                                passwordType: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Bắt buộc";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              SubmitButton(
                                text: "Đăng nhập",
                                onPress: () {
                                  //if (_emailFormKey.currentState!.validate()) {}
                                  Navigator.of(context)
                                      .pushNamed(RoutePaths.DASHBOARD);
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          "Bạn chưa có tài khoản?",
                          style: GoogleFonts.inter(
                            color: AppColors.grey500,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 24),
                        AppButton(
                          text: "Tạo tài khoản",
                          onPress: () => Navigator.of(context)
                              .pushNamed(RoutePaths.REGISTER),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Form(
                          key: _phoneFormKey,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              DefaultTextInput(
                                controller: _phoneNumberController,
                                label: "Nhập số điện thoại",
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Thông tin không hợp lệ";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              SubmitButton(
                                text: "Đăng nhập",
                                onPress: () {
                                  if (_phoneFormKey.currentState!.validate()) {
                                    Navigator.of(context)
                                        .pushNamed(RoutePaths.SMS_LOGIN);
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          "Bạn chưa có tài khoản?",
                          style: GoogleFonts.inter(
                            color: AppColors.grey500,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 24),
                        AppButton(
                          text: "Tạo tài khoản",
                          onPress: () => Navigator.of(context)
                              .pushNamed(RoutePaths.REGISTER),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      /*Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, RoutePaths.DASHBOARD);
          },
          child: const Text("Login"),
        ),
      ),*/
    );
  }
}
