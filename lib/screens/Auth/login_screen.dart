import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:puja_applixation/screens/Auth/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  final otpControllers = List.generate(4, (index) => TextEditingController());
  final formKey = GlobalKey<FormState>();

  bool showOtp = false;
  bool isLoading = false;

  String selectedRole = "Customer";

  @override
  Widget build(BuildContext context) {
    final orange = const Color(0xFFFF6B00);
    final darkBrown = const Color(0xFF4A2C19);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F4EF),

      body: Stack(
        children: [
          /// Mandala Background
          Positioned.fill(
            child: Opacity(
              opacity: 0.045,
              //child: Image.asset("assets/mandala.png", fit: BoxFit.cover),
            ),
          ),

          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 26),

              child: Column(
                children: [
                  // ---------------- LOGO ---------------
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset("assets/images/omlogo.jpg", height: 80),
                  ),

                  const SizedBox(height: 20),

                  // ---------------- TITLE ---------------
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: orange,
                      letterSpacing: 0.5,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    "Sign in to continue your spiritual journey",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // ---------------- CARD ---------------
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(22, 28, 22, 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.09),
                          blurRadius: 22,
                          spreadRadius: 1,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),

                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // --------------- ROLE TITLE ---------------
                          const Text(
                            "Select Role",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF2D2D2D),
                            ),
                          ),

                          const SizedBox(height: 14),

                          // --------------- ROLE OPTIONS ---------------
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              roleBox("Customer", Icons.person, orange),
                              roleBox(
                                "Pandit",
                                Icons.local_fire_department,
                                orange,
                              ),
                              roleBox("Admin", Icons.shield, orange),
                            ],
                          ),

                          const SizedBox(height: 20),

                          Text(
                            "Book pujas and connect with pandits",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // --------------- PHONE FIELD ---------------
                          TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            maxLength: 10,
                            validator: (value) {
                              if (value!.isEmpty)
                                return "Phone number required";
                              if (value.length != 10)
                                return "Enter correct number";
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Mobile Number",
                              labelStyle: TextStyle(color: Colors.grey[600]),
                              prefixText: "+91 ",
                              counterText: "",
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 18,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: orange, width: 2),
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          // --------------- INFO TEXT ---------------
                          Text(
                            "We'll send you a verification code here",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black.withOpacity(0.55),
                            ),
                          ),

                          const SizedBox(height: 18),

                          // --------------- OTP BUTTON ---------------
                          sendOtpButton(orange),

                          if (showOtp) ...[
                            const SizedBox(height: 28),
                            const Text(
                              "Enter OTP",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            const SizedBox(height: 12),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(4, otpBox),
                            ),

                            const SizedBox(height: 24),

                            verifyOtp(orange),
                          ],
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 26),

                  // --------------- SIGNUP TEXT ---------------
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        color: darkBrown.withOpacity(0.8),
                        fontSize: 15,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign up",
                          style: TextStyle(
                            color: orange,
                            fontWeight: FontWeight.w700,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // 👉 Navigate to Signup Screen here
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => RegistrationScreen(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),

                  // --------------- TERMS TEXT ---------------
                  Text(
                    "By signing in you agree to our Terms & Privacy Policy",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.55),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // -------------------------------------------------------------
  // ROLE BOX
  // -------------------------------------------------------------
  Widget roleBox(String title, IconData icon, Color orange) {
    final isSelected = selectedRole == title;
    return GestureDetector(
      onTap: () => setState(() => selectedRole = title),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 92,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? orange.withOpacity(0.12) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? orange : const Color(0xFFD9D9D9),
            width: isSelected ? 2.4 : 1.3,
          ),
        ),
        child: Column(
          children: [
            Icon(icon, size: 25, color: isSelected ? orange : Colors.grey[600]),
            const SizedBox(height: 6),
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.black : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // -------------------------------------------------------------
  // SEND OTP BUTTON
  // -------------------------------------------------------------
  Widget sendOtpButton(Color orange) {
    return GestureDetector(
      onTap: () {
        if (formKey.currentState!.validate()) {
          setState(() => showOtp = true);
        }
      },
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [orange, orange.withOpacity(0.8)]),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Send OTP",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  // -------------------------------------------------------------
  // VERIFY BUTTON
  // -------------------------------------------------------------
  Widget verifyOtp(Color orange) {
    return GestureDetector(
      onTap: () {
        if (otpControllers.any((c) => c.text.isEmpty)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Please enter complete OTP"),
              backgroundColor: Colors.redAccent,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("OTP Verified!"),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [orange, orange.withOpacity(0.8)]),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: Text(
            "Verify OTP",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  // -------------------------------------------------------------
  // OTP BOX
  // -------------------------------------------------------------
  Widget otpBox(int index) {
    return Container(
      width: 58,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.orange, width: 1.4),
      ),
      child: TextField(
        controller: otpControllers[index],
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: "",
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
