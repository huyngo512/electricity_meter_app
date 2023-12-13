import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';

class VNPayPayment {
  static Map<String, dynamic> _sortParams(Map<String, dynamic> params) {
    final sortedParams = <String, dynamic>{};
    final keys = params.keys.toList()..sort();
    for (String key in keys) {
      sortedParams[key] = params[key];
    }
    return sortedParams;
  }

  static String generatePaymentUrl({
    String url = 'https://sandbox.vnpayment.vn/paymentv2/vpcpay.html',
    required String version,
    String command = 'pay',
    required String tmnCode,
    required double amount,
    String? createAt,
    String? expiredAt,
    String currencyCode = 'VND',
    required String ipAdress,
    String locale = 'vn',
    String orderInfo = 'Pay Order',
    required String returnUrl,
    required String vnpayHashKey,
  }) {
    DateTime currentTime = DateTime.now();
    DateTime expiredTime = currentTime.add(const Duration(minutes: 30));
    final params = <String, dynamic>{
      'vnp_Version': version,
      'vnp_Command': command,
      'vnp_TmnCode': tmnCode,
      'vnp_Amount': (amount * 100).toStringAsFixed(0),
      'vnp_OrderType': '120000',
      'vnp_CreateDate': createAt ??
          DateFormat('yyyyMMddHHmmss').format(currentTime).toString(),
      'vnp_ExpireDate': expiredAt ??
          DateFormat('yyyyMMddHHmmss').format(expiredTime).toString(),
      'vnp_CurrCode': currencyCode,
      'vnp_IpAddr': ipAdress,
      'vnp_Locale': locale,
      'vnp_OrderInfo': orderInfo,
      'vnp_ReturnUrl': returnUrl,
      'vnp_TxnRef': DateFormat('HHmmss').format(currentTime).toString(),
    };

    var sortedParam = VNPayPayment._sortParams(params);

    final hashDataBuffer = StringBuffer();
    sortedParam.forEach((key, value) {
      hashDataBuffer.write(key);
      hashDataBuffer.write('=');
      hashDataBuffer.write(value);
      hashDataBuffer.write('&');
    });

    String query = Uri(queryParameters: sortedParam).query;
    var digest =
        Hmac(sha512, utf8.encode(vnpayHashKey)).convert(utf8.encode(query));
    String vnpSecureHash = hex.encode(digest.bytes);

    String paymentUrl = "$url?$query&vnp_SecureHash=$vnpSecureHash";
    return paymentUrl;
  }
}
