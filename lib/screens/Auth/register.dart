import 'package:flutter/material.dart';
import 'package:puja_applixation/Global/roles.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    final orange = const Color(0xFFFF6B00);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F4EF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
          child: Column(
            children: [
              const SizedBox(height: 25),

              // ---------------- LOGO ----------------
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset("assets/images/omlogo.jpg", height: 80),
              ),
              const SizedBox(height: 20),

              // ---------------- TITLE ----------------
              Text(
                "Create your account",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: orange,
                  letterSpacing: 0.4,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                "Join our spiritual community",
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),

              const SizedBox(height: 32),

              // ---------------- LABEL ----------------
              Row(
                children: const [
                  Text(
                    "Choose your role",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2D2D2D),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // ---------------- ROLE SECTION ----------------
              Column(
                children: [
                  roleTile(
                    title: "Customer",
                    subtitle: "Book pujas and connect with pandit",
                    icon: Icons.person,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 14),
                  roleTile(
                    title: "Pandit",
                    subtitle: "Offer services and manage booking",
                    icon: Icons.local_fire_department,
                    color: orange,
                  ),
                  const SizedBox(height: 14),
                  roleTile(
                    title: "Admin",
                    subtitle: "Manage platform and user",
                    icon: Icons.shield,
                    color: Colors.deepPurple,
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // ---------------- CONTINUE BUTTON ----------------
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/registerStepOne");
                  // Navigate to next screen
                },
                child: Container(
                  height: 56,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: LinearGradient(
                      colors: [orange, orange.withOpacity(0.7)],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ---------------- LOGIN OPTION ----------------
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // back to login
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 15,
                        color: orange,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // -------------------------------------------------------
  // ROLE TILE
  // -------------------------------------------------------
  Widget roleTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    final isSelected = selectedRole == title;

    return GestureDetector(
      onTap: () => setState(() => selectedRole = title),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 240),
        padding: const EdgeInsets.all(18),
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.08) : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected ? color : Colors.grey.shade300,
            width: isSelected ? 2 : 1.3,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
