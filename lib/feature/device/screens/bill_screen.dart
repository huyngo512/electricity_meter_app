import 'package:electricity_meter_app/constants/app_colors.dart';
import 'package:electricity_meter_app/feature/device/screens/vnpay_screen.dart';
import 'package:electricity_meter_app/general/utils/vnpay_payment.dart';
import 'package:electricity_meter_app/general/widgets/app_navigation_bar.dart';
import 'package:electricity_meter_app/general/widgets/base_widget.dart';
import 'package:electricity_meter_app/general/widgets/buttons/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({super.key});

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  String responseCode = '';

  void onPayment() async {
    var paymentUrl = VNPayPayment.generatePaymentUrl(
      version: '2.1.0',
      tmnCode: "MZ12VTB4",
      amount: 950000,
      ipAdress: '127.0.0.1',
      returnUrl: 'https://abc.com/return',
      vnpayHashKey: 'ANSMGFIOANOAXXXVAEZPVZMTEWGAWKCP',
    );

    if (paymentUrl.isNotEmpty) {
      pushNewScreen(
        context,
        screen: VNPayScreen(url: paymentUrl),
        withNavBar: false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
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
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(Icons.chevron_left),
                    ),
                  ),
                ),
              ],
              title: "Hóa đơn",
              rightItems: const [
                SizedBox(),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mã đơn hàng: ID202198754",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textdark,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Người đặt: hngo512",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textdark,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Mã sân: ID202303003",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textdark,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Tên sân: Sân Hoàng Cầu 9",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textdark,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Địa chỉ: 69 Hoàng Cầu, Chợ Dừa, Đống Đa, Hà Nội",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textdark,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Khung giờ:",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textdark,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "17:00-18:30 27-11-2023 - 600.000 VNĐ",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryturquoise,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "15:30-17:00 27-11-2023 - 350.000 VNĐ",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryturquoise,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Tổng tiền: 950.000 VNĐ",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textdark,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SubmitButton(
              text: "Thanh toán",
              onPress: () {
                onPayment();
              },
            ),
          ],
        ),
      ),
    );
  }
}
