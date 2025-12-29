import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  static const Color saffron = Color(0xFFFF6A00);
  static const Color saffronDark = Color(0xFFE65100);
  static const Color bgLight = Color(0xFFFFF6EC);
  static const Color darkFooter = Color(0xFF0E1624);

  void _goToLogin(BuildContext context) {
    // TODO: Replace with actual Login Screen navigation
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (_) => const PlaceholderLoginScreen()),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.6,
        title: Row(
          children: const [
            CircleAvatar(
              backgroundColor: saffron,
              child: Icon(Icons.self_improvement, color: Colors.white),
            ),
            SizedBox(width: 8),
            Text(
              "VidhiVidhana",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _heroSection(context),
            _howItWorks(context),
            _differenceSection(context),
            _whyChoose(context),
            _getInTouch(context),
            _footer(),
          ],
        ),
      ),
    );
  }

  // --------------------------------------------------
  // HERO
  // --------------------------------------------------
  Widget _heroSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFFE0C3), bgLight],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: saffron.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "✨ Trusted by 10,000+ families",
              style: TextStyle(color: saffronDark),
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            "Book Verified\nPandits in Minutes",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Connect with experienced pandits for all your sacred ceremonies. Authentic Vedic rituals with modern convenience.",
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 24),

          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/login'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 54),
              backgroundColor: saffron,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text("🔍 Find a Pandit"),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: () => _goToLogin(context),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 54),
              foregroundColor: saffronDark,
              side: const BorderSide(color: saffron),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text("📅 Book Now"),
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              Icon(Icons.star, color: Colors.amber, size: 18),
              Icon(Icons.star, color: Colors.amber, size: 18),
              Icon(Icons.star, color: Colors.amber, size: 18),
              Icon(Icons.star, color: Colors.amber, size: 18),
              Icon(Icons.star_half, color: Colors.amber, size: 18),
              SizedBox(width: 8),
              Text("4.9/5 from 2,500+ reviews"),
            ],
          ),
        ],
      ),
    );
  }

  // --------------------------------------------------
  // HOW IT WORKS
  // --------------------------------------------------
  Widget _howItWorks(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "How It Works",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text("Book your pandit in 3 simple steps"),
          const SizedBox(height: 24),
          _stepCard(
            context,
            "01",
            Icons.search,
            "Choose Your Puja",
            "Select from 50+ rituals",
          ),
          _stepCard(
            context,
            "02",
            Icons.people,
            "Pick a Pandit",
            "Verified pandits with reviews",
          ),
          _stepCard(
            context,
            "03",
            Icons.check_circle,
            "Confirm Booking",
            "Schedule & relax",
          ),
        ],
      ),
    );
  }

  Widget _stepCard(
    BuildContext context,
    String step,
    IconData icon,
    String title,
    String desc,
  ) {
    return InkWell(
      onTap: () => _goToLogin(context),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: saffron,
              child: Text(step, style: const TextStyle(color: Colors.white)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(icon, color: saffron),
                  const SizedBox(height: 6),
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(desc, style: const TextStyle(color: Colors.black54)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --------------------------------------------------
  // WHAT MAKES US DIFFERENT (CENTERED)
  // --------------------------------------------------
  Widget _differenceSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [saffron, saffronDark],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          const Text(
            "What Makes Us Different",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Experience the VidhiVidhana difference",
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 24),
          _centerCard(
            context,
            Icons.verified_user,
            "Background Verified",
            "Strict verification process",
          ),
          _centerCard(
            context,
            Icons.school,
            "Experienced Scholars",
            "15+ years Vedic knowledge",
          ),
          _centerCard(
            context,
            Icons.schedule,
            "Punctual Service",
            "98% on-time arrival",
          ),
          _centerCard(
            context,
            Icons.support_agent,
            "Complete Support",
            "Samagri & guidance",
          ),
        ],
      ),
    );
  }

  Widget _centerCard(
    BuildContext context,
    IconData icon,
    String title,
    String desc,
  ) {
    return InkWell(
      onTap: () => _goToLogin(context),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.18),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 36),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              desc,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  // --------------------------------------------------
  // WHY CHOOSE
  // --------------------------------------------------
  Widget _whyChoose(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Why Choose VidhiVidhana",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
            "Trusted by thousands of families across India",
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 24),

          _whyCard(
            context,
            Icons.verified_user,
            "Verified Pandits",
            "500+ experienced & background-verified pandits",
          ),
          _whyCard(
            context,
            Icons.auto_awesome,
            "Authentic Rituals",
            "Traditional Vedic practices followed precisely",
          ),
          _whyCard(
            context,
            Icons.event_available,
            "Easy Booking",
            "Book trusted pandits in just a few taps",
          ),
          _whyCard(
            context,
            Icons.support_agent,
            "24×7 Support",
            "Dedicated assistance whenever you need",
          ),
        ],
      ),
    );
  }

  // --------------------------------------------------
  // GET IN TOUCH
  // --------------------------------------------------
  Widget _getInTouch(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [saffron, Color(0xFFEA0000)]),
      ),
      child: Column(
        children: [
          const Text(
            "Get in Touch",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Have questions? We're here to help",
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 20),
          _contactRow(Icons.call, "+91 98765 43210"),
          _contactRow(Icons.email, "contact@divinepandit.com"),
          _contactRow(Icons.location_on, "All across India"),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _goToLogin(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: saffronDark,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text("Schedule a Call"),
          ),
        ],
      ),
    );
  }

  Widget _contactRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  // --------------------------------------------------
  // FOOTER
  // --------------------------------------------------
  Widget _footer() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: darkFooter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "VidhiVidhana",
            style: TextStyle(
              color: saffron,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            "Your trusted partner for all spiritual ceremonies",
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 24),

          _footerSection("Services", [
            "Wedding Ceremonies",
            "Griha Pravesh",
            "Puja Booking",
            "Samagri Store",
          ]),
          _footerSection("Company", [
            "About Us",
            "Our Pandits",
            "Contact",
            "Careers",
          ]),
          _footerSection("Legal", [
            "Privacy Policy",
            "Terms of Service",
            "Refund Policy",
          ]),

          const Divider(color: Colors.white24, height: 32),
          Center(
            child: const Text(
              "© 2025 VidhiVidhana. All rights reserved.",
              style: TextStyle(color: Colors.white54),
            ),
          ),
          const SizedBox(height: 6),
          Center(
            child: const Text(
              "Powered by Visito Venture India Pvt. Ltd",
              style: TextStyle(color: Colors.white54),
            ),
          ),
          const SizedBox(height: 6),
          Center(
            child: const Text(
              "हर हर महादेव | जय श्री राम",
              style: TextStyle(color: Colors.white54),
            ),
          ),
        ],
      ),
    );
  }

  Widget _footerSection(String title, List<String> items) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          ...items.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(e, style: const TextStyle(color: Colors.white70)),
            ),
          ),
        ],
      ),
    );
  }

  // --------------------------------------------------
  // PLACEHOLDER LOGIN SCREEN
  // --------------------------------------------------

  Widget _whyCard(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
  ) {
    return InkWell(
      //onTap: () => _goToLogin(context),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.orange, size: 28),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(color: Colors.black54)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
