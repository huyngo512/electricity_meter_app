import 'package:dio/dio.dart';
import 'package:electricity_meter_app/apis/interceptor/logger_interceptor.dart';
import 'package:electricity_meter_app/constants/app_config.dart';

class DioManager {
  static DioManager? _instance;

  static DioManager get instance {
    if (_instance != null) return _instance!;
    _instance = DioManager._init();
    return _instance!;
  }

  late final Dio dio;

  DioManager._init() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        followRedirects: true,
        responseType: ResponseType.json,
      ),
    )..interceptors.addAll([
        LoggerIntercepter(),
      ]);
  }
}
