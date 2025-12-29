import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:puja_applixation/Global/roles.dart';

class CreateAccountCard extends StatefulWidget {
  @override
  _CreateAccountCardState createState() => _CreateAccountCardState();
}

class _CreateAccountCardState extends State<CreateAccountCard> {
  int step = 1;
  final _formKey = GlobalKey<FormState>();

  final String baseUrl = "http://13.232.190.230:2207";

  TextEditingController fullName = TextEditingController();
  TextEditingController phone = TextEditingController();

  TextEditingController phoneOtp1 = TextEditingController();
  TextEditingController phoneOtp2 = TextEditingController();
  TextEditingController phoneOtp3 = TextEditingController();
  TextEditingController phoneOtp4 = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController emailOtp1 = TextEditingController();
  TextEditingController emailOtp2 = TextEditingController();
  TextEditingController emailOtp3 = TextEditingController();
  TextEditingController emailOtp4 = TextEditingController();

  bool isLoading = false;

  // ----------------------------------------------------
  // UI
  // ----------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9E7D3),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            elevation: 10,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Container(
              width: 340,
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Image.asset("assets/images/omlogo.jpg", height: 80),
                  const SizedBox(height: 12),
                  const Text(
                    "Create Your Account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Join our spiritual community",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(height: 15),
                  _progressBar(),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        if (step == 1) _fullNameField(),
                        if (step == 2) _phoneField(),
                        if (step == 3) _phoneOtpField(),
                        if (step == 4) _emailField(),
                        if (step == 5) _emailOtpField(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buttonSection(),
                  const SizedBox(height: 10),
                  _signinText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ----------------------------------------------------
  // PROGRESS BAR
  // ----------------------------------------------------
  Widget _progressBar() {
    return Row(
      children: [
        _circle("1", step >= 1),
        _line(step >= 2),
        _circle("2", step >= 2),
        _line(step >= 3),
        _circle("3", step >= 3),
        _line(step >= 4),
        _circle("4", step >= 4),
        _line(step >= 5),
        _circle("5", step >= 5),
      ],
    );
  }

  Widget _circle(String t, bool active) {
    return CircleAvatar(
      radius: 13,
      backgroundColor: active ? Colors.deepOrange : Colors.grey.shade300,
      child: Text(
        t,
        style: TextStyle(
          color: active ? Colors.white : Colors.black54,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _line(bool active) {
    return Expanded(
      child: Container(
        height: 2,
        color: active ? Colors.deepOrange : Colors.grey.shade300,
      ),
    );
  }

  // ----------------------------------------------------
  // FIELDS
  // ----------------------------------------------------
  Widget _fullNameField() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _label("Full Name"),
      TextFormField(
        controller: fullName,
        validator: (v) => v!.isEmpty ? "Full name required" : null,
        decoration: _input("Enter full name"),
      ),
    ],
  );

  Widget _phoneField() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _label("Phone Number"),
      TextFormField(
        controller: phone,
        maxLength: 10,
        keyboardType: TextInputType.number,
        validator: (v) => v!.length != 10 ? "Enter valid phone number" : null,
        decoration: _input("Enter phone number"),
      ),
    ],
  );

  Widget _emailField() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _label("Email Address"),
      TextFormField(
        controller: email,
        validator: (v) => !v!.contains("@") ? "Invalid email" : null,
        decoration: _input("Enter email"),
      ),
    ],
  );

  Widget _phoneOtpField() => _otpSection(
    "Verify Phone OTP",
    phoneOtp1,
    phoneOtp2,
    phoneOtp3,
    phoneOtp4,
  );

  Widget _emailOtpField() => _otpSection(
    "Verify Email OTP",
    emailOtp1,
    emailOtp2,
    emailOtp3,
    emailOtp4,
  );

  Widget _otpSection(
    String title,
    TextEditingController a,
    TextEditingController b,
    TextEditingController c,
    TextEditingController d,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label(title),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _otpBox(a, next: b),
            _otpBox(b, next: c, prev: a),
            _otpBox(c, next: d, prev: b),
            _otpBox(d, prev: c),
          ],
        ),
        TextButton(onPressed: () {}, child: const Text("Resend OTP")),
      ],
    );
  }

  Widget _otpBox(
    TextEditingController c, {
    TextEditingController? next,
    TextEditingController? prev,
  }) {
    return SizedBox(
      width: 55,
      height: 55,
      child: TextFormField(
        controller: c,
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        validator: (v) => v!.isEmpty ? "*" : null,
        onChanged: (v) {
          if (v.isNotEmpty && next != null) {
            FocusScope.of(context).nextFocus();
          } else if (v.isEmpty && prev != null) {
            FocusScope.of(context).previousFocus();
          }
        },
        decoration: const InputDecoration(counterText: ""),
      ),
    );
  }

  // ----------------------------------------------------
  // BUTTONS
  // ----------------------------------------------------
  Widget _buttonSection() {
    return Row(
      children: [
        if (step > 1)
          _btn("Back", Icons.arrow_back, () => setState(() => step--), true),
        _btn(
          step == 5 ? "Finish" : "Continue",
          step == 5 ? Icons.check : Icons.arrow_forward,
          _handleNext,
          false,
        ),
      ],
    );
  }

  Widget _btn(String t, IconData i, VoidCallback fn, bool back) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ElevatedButton.icon(
          onPressed: isLoading ? null : fn,
          icon: Icon(i),
          label: Text(t),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(0, 55),
            backgroundColor: back ? Colors.white : Colors.deepOrange,
            foregroundColor: back ? Colors.deepOrange : Colors.white,
            side: back
                ? const BorderSide(color: Colors.deepOrange)
                : BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _signinText() => TextButton(
    onPressed: () {},
    child: const Text(
      "Already have an account? Sign In",
      style: TextStyle(color: Colors.deepOrange),
    ),
  );

  // ----------------------------------------------------
  // FLOW LOGIC (API INTEGRATED)
  // ----------------------------------------------------
  Future<void> _handleNext() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      setState(() => isLoading = true);

      if (step == 2) await _sendMobileOtp();
      if (step == 3) await _verifyMobileOtp();
      if (step == 4) await _sendEmailOtp();
      if (step == 5) {
        await _verifyEmailOtp();
        await _completeRegistration();
        _navigate();
        return;
      }

      setState(() => step++);
    } catch (e) {
      _show(e.toString());
    } finally {
      setState(() => isLoading = false);
    }
  }

  // ----------------------------------------------------
  // API CALLS
  // ----------------------------------------------------
  Future<void> _sendMobileOtp() => _post("/auth/register/send-mobile-otp", {
    "fullName": fullName.text.trim(),
    "phone": phone.text.trim(),
  });

  Future<void> _verifyMobileOtp() => _post("/auth/register/verify-mobile-otp", {
    "phone": phone.text.trim(),
    "otp": _phoneOtp(),
  });

  Future<void> _sendEmailOtp() => _post("/auth/register/send-email-otp", {
    "phone": phone.text.trim(),
    "email": email.text.trim(),
  });

  Future<void> _verifyEmailOtp() => _post("/auth/register/verify-email-otp", {
    "phone": phone.text.trim(),
    "email": email.text.trim(),
    "otp": _emailOtp(),
  });

  Future<void> _completeRegistration() => _post("/auth/register/complete", {
    "phone": phone.text.trim(),
    "email": email.text.trim(),
    "fullname": fullName.text.trim(),
    "role_id": selectedRole == "Pandit" ? 2 : 1,
  });

  Future<void> _post(String path, Map body) async {
    final res = await http.post(
      Uri.parse(baseUrl + path),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    final data = jsonDecode(res.body);
    _show(_extractMessage(data));

    if (res.statusCode >= 400) {
      throw _extractMessage(data);
    }
  }

  // ----------------------------------------------------
  // HELPERS
  // ----------------------------------------------------
  String _phoneOtp() =>
      phoneOtp1.text + phoneOtp2.text + phoneOtp3.text + phoneOtp4.text;

  String _emailOtp() =>
      emailOtp1.text + emailOtp2.text + emailOtp3.text + emailOtp4.text;

  String _extractMessage(dynamic data) {
    final msg = data["message"];
    if (msg is String) return msg;
    if (msg is List) return msg.join(", ");
    return "Something went wrong";
  }

  void _navigate() {
    if (selectedRole == "Pandit") {
      Navigator.pushReplacementNamed(context, '/panditDashboard');
    } else {
      Navigator.pushReplacementNamed(context, '/customerDashboard');
    }
  }

  void _show(String m) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(m)));
  }

  InputDecoration _input(String h) =>
      InputDecoration(border: const OutlineInputBorder(), hintText: h);

  Widget _label(String t) =>
      Text(t, style: const TextStyle(fontWeight: FontWeight.w500));
}
