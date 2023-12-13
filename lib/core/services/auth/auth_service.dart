import 'dart:io';

import 'package:electricity_meter_app/core/models/auth_model.dart';
import 'package:electricity_meter_app/core/models/login_model.dart';
import 'package:electricity_meter_app/core/services/auth/interface_auth_service.dart';

class AuthService extends IAuthService {
  AuthService(super.dioManager);

  @override
  Future<String?> login({
    required String username,
    required String password,
  }) async {
    var response = await dioManager.dio.post(
      '/user/login',
      data: LoginModel(
        username: "user_14",
        password: '123456',
      ).toJson(),
    );

    if (response.statusCode == HttpStatus.ok) {
      if (response.data['result'] == 'success') {
        print(AuthModel.fromJson(response.data).token);
        return AuthModel.fromJson(response.data).token;
      }

      return throw Exception(response.data['reason']);
    }

    return throw Exception();
  }
}
