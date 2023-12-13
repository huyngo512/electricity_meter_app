import 'package:electricity_meter_app/apis/dio_manager.dart';

abstract class IAuthService {
  final DioManager dioManager;

  IAuthService(this.dioManager);

  Future<String?> login({
    required String username,
    required String password,
  });
}
