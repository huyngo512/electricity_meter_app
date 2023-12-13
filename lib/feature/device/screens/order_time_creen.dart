import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:electricity_meter_app/constants/app_colors.dart';
import 'package:electricity_meter_app/feature/device/screens/bill_screen.dart';
import 'package:electricity_meter_app/general/models/time_model.dart';
import 'package:electricity_meter_app/general/utils/utils.dart';
import 'package:electricity_meter_app/general/widgets/app_navigation_bar.dart';
import 'package:electricity_meter_app/general/widgets/base_widget.dart';
import 'package:electricity_meter_app/general/widgets/buttons/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class OrdertimeScreen extends StatefulWidget {
  const OrdertimeScreen({super.key});

  @override
  State<OrdertimeScreen> createState() => _OrdertimeScreenState();
}

class _OrdertimeScreenState extends State<OrdertimeScreen> {
  List<TimeModel> list = [
    TimeModel(
      startTime: DateTime.parse('2023-11-27 05:00:00'),
      endTime: DateTime.parse('2023-11-27 06:30:00'),
      countPitch: 2,
      price: 350000,
      isSelected: false,
    ),
    TimeModel(
      startTime: DateTime.parse('2023-11-27 06:30:00'),
      endTime: DateTime.parse('2023-11-27 08:00:00'),
      countPitch: 2,
      price: 350000,
      isSelected: false,
    ),
    TimeModel(
      startTime: DateTime.parse('2023-11-27 08:00:00'),
      endTime: DateTime.parse('2023-11-27 09:30:00'),
      countPitch: 2,
      price: 350000,
      isSelected: false,
    ),
    TimeModel(
      startTime: DateTime.parse('2023-11-27 09:30:00'),
      endTime: DateTime.parse('2023-11-27 11:00:00'),
      countPitch: 2,
      price: 350000,
      isSelected: false,
    ),
    TimeModel(
      startTime: DateTime.parse('2023-11-27 11:00:00'),
      endTime: DateTime.parse('2023-11-27 12:30:00'),
      countPitch: 2,
      price: 350000,
      isSelected: false,
    ),
    TimeModel(
      startTime: DateTime.parse('2023-11-27 12:30:00'),
      endTime: DateTime.parse('2023-11-27 14:00:00'),
      countPitch: 2,
      price: 350000,
      isSelected: false,
    ),
    TimeModel(
      startTime: DateTime.parse('2023-11-27 14:00:00'),
      endTime: DateTime.parse('2023-11-27 15:30:00'),
      countPitch: 0,
      price: 350000,
      isSelected: false,
    ),
    TimeModel(
      startTime: DateTime.parse('2023-11-27 15:30:00'),
      endTime: DateTime.parse('2023-11-27 17:00:00'),
      countPitch: 2,
      price: 350000,
      isSelected: false,
    ),
    TimeModel(
      startTime: DateTime.parse('2023-11-27 17:00:00'),
      endTime: DateTime.parse('2023-11-27 18:30:00'),
      countPitch: 2,
      price: 600000,
      isSelected: false,
    ),
    TimeModel(
      startTime: DateTime.parse('2023-11-27 18:30:00'),
      endTime: DateTime.parse('2023-11-27 20:00:00'),
      countPitch: 2,
      price: 600000,
      isSelected: false,
    ),
    TimeModel(
      startTime: DateTime.parse('2023-11-27 20:00:00'),
      endTime: DateTime.parse('2023-11-27 21:30:00'),
      countPitch: 0,
      price: 600000,
      isSelected: false,
    ),
    TimeModel(
      startTime: DateTime.parse('2023-11-27 21:30:00'),
      endTime: DateTime.parse('2023-11-27 23:00:00'),
      countPitch: 2,
      price: 350000,
      isSelected: false,
    ),
  ];

  List<TimeModel> selectedList = [];

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
              title: "Đặt sân",
              rightItems: const [
                SizedBox(),
              ],
            ),
            const SizedBox(height: 10),
            Container(
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
                      "Chọn ngày",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textdark,
                      ),
                    ),
                    const SizedBox(height: 10),
                    DatePicker(
                      DateTime.now(),
                      initialSelectedDate: DateTime.now(),
                      selectionColor: Colors.black,
                      selectedTextColor: Colors.white,
                      locale: 'vi',
                      height: 90,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Khung giờ:",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textdark,
                      ),
                    ),
                    SizedBox(
                      height: 400,
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (BuildContext context, index) {
                          return _timePickerItem(
                            item: list[index],
                            onTap: () {
                              setState(() {
                                list[index].isSelected =
                                    !list[index].isSelected;
                                if (list[index].isSelected == true) {
                                  selectedList.add(TimeModel(
                                      startTime: list[index].startTime,
                                      endTime: list[index].endTime,
                                      countPitch: list[index].countPitch,
                                      price: list[index].price,
                                      isSelected: true));
                                } else if (list[index].isSelected == false) {
                                  selectedList.removeWhere((element) =>
                                      element.startTime.toString() ==
                                      list[index].startTime.toString());
                                }
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SubmitButton(
              text: "Đặt ngay",
              onPress: () {
                pushNewScreen(
                  context,
                  screen: const BillScreen(),
                  withNavBar: false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _timePickerItem(
      {required TimeModel item, required VoidCallback onTap}) {
    return ListTile(
      title: Text(
        '${Utils.getTimeStopwatch(item.startTime)} - ${Utils.getTimeStopwatch(item.endTime)}',
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textdark,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Số sân còn lại: ${item.countPitch}"),
          Text("Giá: ${item.price}"),
        ],
      ),
      trailing: item.countPitch == 0
          ? const Icon(
              Icons.block,
              color: Colors.red,
            )
          : item.isSelected
              ? const Icon(
                  Icons.check_circle,
                  color: AppColors.primaryturquoise,
                )
              : const Icon(
                  Icons.check_circle_outline,
                  color: AppColors.grey,
                ),
      onTap: () {
        if (item.countPitch != 0) {
          onTap.call();
        }
      },
    );
  }
}
