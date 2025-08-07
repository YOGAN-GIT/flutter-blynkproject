import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'auth_service.dart';

class OtpScreen extends StatefulWidget {
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _otp = '';
  bool _loading = false;
  String? _error;

  void _verifyOtp(String mobile, String otp) async {
    setState(() {
      _loading = true;
      _error = null;
    });
    
    final success = await AuthService.verifyOtp(mobile, otp);
    setState(() => _loading = false);
    if (success) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() {
        _error = "Invalid OTP";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mobile = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            SizedBox(height: 80),
            Text('Login', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(
              'Enter the one-time code sent to your mobile\nending with ${mobile.substring(mobile.length - 4)}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
            ),
            SizedBox(height: 30),
            PinCodeTextField(
              appContext: context,
              length: 4,
              obscureText: false,
              animationType: AnimationType.fade,
              cursorColor: Colors.black,
              keyboardType: TextInputType.number,
              autoFocus: true,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(7),
                fieldHeight: 52,
                fieldWidth: 52,
                activeColor: Color(0xFF6A1B9A),
                selectedColor: Color(0xFF6A1B9A),
                inactiveColor: Colors.grey.shade400,
                inactiveFillColor: Colors.white,
                activeFillColor: Colors.white,
                selectedFillColor: Colors.white,
                borderWidth: 1.5,
              ),
              animationDuration: Duration(milliseconds: 200),
              enableActiveFill: true,
              onChanged: (val) {
                setState(() => _otp = val);
              },
              onCompleted: (val) {
               
              },
              errorTextSpace: _error != null ? 16 : 0,
            ),
            if (_error != null)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  _error!,
                  style: TextStyle(color: Colors.red, fontSize: 13),
                ),
              ),
            SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6A1B9A),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.symmetric(vertical: 13),
                  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                child: _loading
                    ? SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : Text('Login'),
                onPressed: _loading || _otp.length < 4
                    ? null
                    : () => _verifyOtp(mobile, _otp),
              ),
            ),
            SizedBox(height: 18),
           
          ],
        ),
      ),
    );
  }
}