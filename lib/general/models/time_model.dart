// ignore_for_file: public_member_api_docs, sort_constructors_first
class TimeModel {
  DateTime startTime;
  DateTime endTime;
  int countPitch;
  int price;
  bool isSelected;

  TimeModel({
    required this.startTime,
    required this.endTime,
    required this.countPitch,
    required this.price,
    required this.isSelected,
  });
}
