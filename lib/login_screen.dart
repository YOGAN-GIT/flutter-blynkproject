import 'package:flutter/material.dart';
import 'auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller = TextEditingController();
  String? _error;
  bool _loading = false;

  Future<void> _sendOtp() async {
    setState(() => _loading = true);
    var success = await AuthService.sendOtp(_controller.text);
    setState(() => _loading = false);
    if (success) {
      Navigator.pushNamed(context, '/otp', arguments: _controller.text);
    } else {
      setState(() => _error = "Failed to send OTP");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            SizedBox(height: 80),
            Text('Welcome to Blynk', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('Secure payments, instant rewards — all in one place.', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 40),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: 'Mobile Number', errorText: _error),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF6A1B9A)),
                ),
                child: _loading ? CircularProgressIndicator() : Text('Send OTP'),
                onPressed: _loading ? null : _sendOtp,
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}