import 'package:electricity_meter_app/apis/dio_manager.dart';
import 'package:electricity_meter_app/constants/app_colors.dart';
import 'package:electricity_meter_app/constants/app_resources.dart';
import 'package:electricity_meter_app/core/blocs/auth/auth_bloc.dart';
import 'package:electricity_meter_app/core/services/auth/auth_service.dart';
import 'package:electricity_meter_app/feature/auth/screens/sms_login_screen.dart';
import 'package:electricity_meter_app/feature/auth/widgets/login_tab_bar.dart';
import 'package:electricity_meter_app/general/routes/route_paths.dart';
import 'package:electricity_meter_app/general/utils/navigate_util.dart';
import 'package:electricity_meter_app/general/widgets/base_widget.dart';
import 'package:electricity_meter_app/general/widgets/buttons/app_button.dart';
import 'package:electricity_meter_app/general/widgets/buttons/submit_button.dart';
import 'package:electricity_meter_app/general/widgets/default_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late TextEditingController _phoneNumberController;
  final _usernameFormKey = GlobalKey<FormState>();
  final _phoneFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
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
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(AppImages.img_login_center),
              ),
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
                "Tham gia ngay để trải nghiệm ứng dụng đặt và quản lý sân bóng một cách hiệu quả.",
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
                          key: _usernameFormKey,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              DefaultTextInput(
                                controller: _usernameController,
                                label: "Nhập username",
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
                                onPress: () async {
                                  if (_usernameFormKey.currentState!
                                      .validate()) {
                                    context.read<AuthBloc>().add(
                                          LoginRequested(
                                            _usernameController.text,
                                            _passwordController.text,
                                          ),
                                        );
                                  }
                                  /*Navigator.of(context)
                                      .pushNamed(RoutePaths.DASHBOARD);*/
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
                          onPress: () {},
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
                                    NavigateUtil().navigateToView(
                                        context, const SmsLoginScreen());
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
                          onPress: () {},
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
