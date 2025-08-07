import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static String baseUrl = 'https://xapi.bulkpe.in/api';

  static Future<bool> sendOtp(String phone) async {
    final url = Uri.parse('$baseUrl/standardLoginForMobile');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"phone": phone}),
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> verifyOtp(String phone, String otp) async {
    final url = Uri.parse('$baseUrl/verifyStandardLoginOtpForMobile');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"phone": phone, "OTP": otp}),
      );
      
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}