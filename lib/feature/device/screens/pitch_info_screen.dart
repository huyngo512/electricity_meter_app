import 'package:electricity_meter_app/constants/app_colors.dart';
import 'package:electricity_meter_app/feature/device/screens/chat_screen.dart';
import 'package:electricity_meter_app/feature/device/screens/map_screen.dart';
import 'package:electricity_meter_app/feature/device/screens/order_time_creen.dart';
import 'package:electricity_meter_app/general/widgets/app_navigation_bar.dart';
import 'package:electricity_meter_app/general/widgets/base_widget.dart';
import 'package:electricity_meter_app/general/widgets/buttons/app_button.dart';
import 'package:electricity_meter_app/general/widgets/buttons/default_button.dart';
import 'package:electricity_meter_app/general/widgets/buttons/small_button.dart';
import 'package:electricity_meter_app/general/widgets/buttons/submit_button.dart';
import 'package:electricity_meter_app/general/widgets/photos/gallery_item.dart';
import 'package:electricity_meter_app/general/widgets/photos/gallery_photo_view_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class PitchInfoScreen extends StatefulWidget {
  const PitchInfoScreen({super.key});

  @override
  State<PitchInfoScreen> createState() => _PitchInfoScreenState();
}

class _PitchInfoScreenState extends State<PitchInfoScreen> {
  bool verticalGallery = false;

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: <Widget>[
            const AppNavigationBar(
              title: "Chi tiết sân",
            ),
            const SizedBox(height: 20),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: galleryItems.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GalleryItemThumbnail(
                                galleryExampleItem: galleryItems[index],
                                onTap: () => open(context, index));
                          }),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Sân Hoàng Mai 10",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textdark,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Địa chỉ: 69 Hoàng Cầu, Chợ Dừa, Đống Đa, Hà Nội",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Số sân: 4",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Số người: 7",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Tiện ích: Có wifi, căng tin",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Giá: 400.000VNĐ - 700.000VNĐ / Trận",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Đánh giá:",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                      ),
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: SmallButton(
                    text: "Liên hệ chủ sân",
                    onPress: () {
                      pushNewScreen(
                        context,
                        screen: const ChatScreen(),
                        withNavBar: false,
                      );
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: SmallButton(
                    backgroundColor: Colors.white,
                    text: "Đánh giá",
                    onPress: () {
                      /*pushNewScreen(
                        context,
                        screen: const MapScreen(),
                        withNavBar: false,
                      );*/
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SubmitButton(
              text: "Đặt sân ngay",
              onPress: () => pushNewScreen(
                context,
                screen: const OrdertimeScreen(),
                withNavBar: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void open(BuildContext context, final int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryPhotoViewWrapper(
          galleryItems: galleryItems,
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
          initialIndex: index,
          scrollDirection: verticalGallery ? Axis.vertical : Axis.horizontal,
        ),
      ),
    );
  }
}
