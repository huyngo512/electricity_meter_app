import 'package:electricity_meter_app/constants/app_colors.dart';
import 'package:electricity_meter_app/constants/app_resources.dart';
import 'package:electricity_meter_app/feature/account/widgets/register_tab_bar.dart';
import 'package:electricity_meter_app/general/routes/route_paths.dart';
import 'package:electricity_meter_app/general/widgets/app_navigation_bar.dart';
import 'package:electricity_meter_app/general/widgets/base_widget.dart';
import 'package:electricity_meter_app/general/widgets/buttons/submit_button.dart';
import 'package:electricity_meter_app/general/widgets/default_text_input.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountRegisterScreen extends StatefulWidget {
  const AccountRegisterScreen({super.key});

  @override
  State<AccountRegisterScreen> createState() => _AccountRegisterScreenState();
}

class _AccountRegisterScreenState extends State<AccountRegisterScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _retypePasswordController;
  late TextEditingController _phoneController;

  final _emailFormKey = GlobalKey<FormState>();
  final _phoneFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _retypePasswordController = TextEditingController();
    _phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _retypePasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 36, right: 37),
          child: Column(
            children: [
              const SizedBox(height: 30),
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
                "Tạo tài khoản",
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                "Tạo ngay tài khoản để tham gia trải nghiệm ứng dụng công tơ điện tử",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 24),
              RegisterTabBar(tabController: _tabController),
              SizedBox(
                height: 500,
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
                              const SizedBox(height: 10),
                              DefaultTextInput(
                                controller: _retypePasswordController,
                                label: "Nhập lại mật khẩu",
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
                                text: "Tạo tài khoản",
                                onPress: () {
                                  if (_emailFormKey.currentState!.validate()) {}
                                },
                              ),
                              const SizedBox(height: 16),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
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
                                        text:
                                            "quyền riêng tư thỏa thuận người dùng",
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
                                controller: _phoneController,
                                label: "Nhập số điện thoại",
                                keyboardType: TextInputType.phone,
                                prefixIcon: Image.asset(
                                  AppIcons.ic_vietnamese,
                                  width: 21,
                                  height: 15,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Thông tin không hợp lệ";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              SubmitButton(
                                text: "Tạo tài khoản",
                                onPress: () {
                                  if (_phoneFormKey.currentState!.validate()) {
                                    Navigator.of(context)
                                        .pushNamed(RoutePaths.SMS_REGISTER);
                                  }
                                },
                              ),
                              const SizedBox(height: 16),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
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
                                        text:
                                            "quyền riêng tư thỏa thuận người dùng",
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
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
