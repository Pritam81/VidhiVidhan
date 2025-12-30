import 'package:flutter/material.dart';

class CustomerDashboard extends StatelessWidget {
  const CustomerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 214, 202),
      appBar: _appBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _welcomeHeader(),
            const SizedBox(height: 20),
            _quickActions(),
            const SizedBox(height: 28),
            _servicesSection(),
            const SizedBox(height: 28),
            _panditsSection(),
            const SizedBox(height: 28),
            _mantraCard(),
            const SizedBox(height: 20),
            _pujaCard(),
            const SizedBox(height: 28),
            _panchangCard(),
          ],
        ),
      ),
    );
  }

  // ---------------- APP BAR ----------------
  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      titleSpacing: 0,
      title: Row(
        children: const [
          SizedBox(width: 12),
          CircleAvatar(
            backgroundColor: Colors.deepOrange,
            child: Text("ॐ", style: TextStyle(color: Colors.white)),
          ),
          SizedBox(width: 8),
          Text(
            "Vidhi Vidhana",
            style: TextStyle(
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none, color: Colors.black),
          onPressed: () => print("Notifications"), // TODO
        ),
        IconButton(
          icon: const Icon(Icons.settings, color: Colors.black),
          onPressed: () => print("Settings"), // TODO
        ),
        const Padding(
          padding: EdgeInsets.only(right: 12),
          child: CircleAvatar(
            backgroundColor: Colors.orange,
            child: Text("SN", style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }

  // ---------------- WELCOME ----------------
  Widget _welcomeHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Welcome Back, Sarthak 🙏",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          "Find and book verified pandits for your ceremonies",
          style: TextStyle(color: Colors.black54),
        ),
      ],
    );
  }

  // ---------------- QUICK ACTIONS ----------------
  Widget _quickActions() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Quick Actions",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _gradientButton("Explore Services", Icons.search, () {
            print("Explore Services"); // TODO
          }),
          const SizedBox(height: 10),
          _outlinedButton("Family Tree", Icons.group, () {
            print("Family Tree"); // TODO
          }),
          const SizedBox(height: 10),
          _outlinedButton("My Bookings", Icons.calendar_month, () {
            print("My Bookings"); // TODO
          }),
        ],
      ),
    );
  }

  // ---------------- SERVICES ----------------
  Widget _servicesSection() {
    final services = [
      _service(Icons.star, "Find Astrologer"),
      _service(Icons.local_fire_department, "Explore Pujas"),
      _service(Icons.favorite, "Kundli Matching"),
      _service(Icons.temple_hindu, "Temple Darshan"),
      _service(Icons.menu_book, "Explore Dharma"),
      _service(Icons.music_note, "Traditional Geets"),
      _service(Icons.home, "Vastu Shastra"),
      _service(Icons.wb_sunny, "Daily Horoscope"),
      _service(Icons.shopping_cart, "Puja Samagri"),
      _service(Icons.confirmation_number, "Numerology"),
      _service(Icons.access_time, "Muhurat"),
      _service(Icons.celebration, "Festivals"),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Our Services",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 14),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: services.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            childAspectRatio: 1.05,
          ),
          itemBuilder: (_, i) => services[i],
        ),
      ],
    );
  }

  Widget _service(IconData icon, String title) {
    return InkWell(
      onTap: () => print(title), // TODO
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: _cardDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: Colors.orange.withOpacity(.15),
              child: Icon(icon, color: Colors.deepOrange),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- PANDITS ----------------
  Widget _panditsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Available Pandits Near You",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 14),
        _panditCard("Pandit Sharma Ji", "Mumbai", "₹2,500", 4.9),
        _panditCard("Pandit Verma Ji", "Delhi", "₹3,000", 4.8),
        _panditCard("Pandit Mishra Ji", "Bangalore", "₹2,000", 4.7),
      ],
    );
  }

  Widget _panditCard(String name, String city, String price, double rating) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage(
              "assets/pandit_placeholder.png",
            ), // optional
            backgroundColor: Colors.orange,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(city, style: const TextStyle(color: Colors.black54)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.amber),
                    Text(" $rating"),
                    const Spacer(),
                    Text(
                      price,
                      style: const TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => print("Contact $name"), // TODO
                        child: const Text("Contact"),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => print("Book $name"), // TODO
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                        ),
                        child: const Text("Book Now"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- MANTRA ----------------
  Widget _mantraCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFF6A00), Color(0xFFFF3D00)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            "📿 Mantra of the Day",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text(
            "ॐ गं गणपतये नमः",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(
            "Om Gam Ganapataye Namaha",
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  // ---------------- PUJA ----------------
  Widget _pujaCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: _cardDecoration(),
      child: Column(
        children: [
          const Text(
            "✨ Puja of the Day",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Icon(Icons.temple_hindu, size: 48, color: Colors.deepOrange),
          const SizedBox(height: 8),
          const Text(
            "Ganesh Puja",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 12),
          _gradientButton("Learn More", Icons.arrow_forward, () {
            print("Learn More Puja"); // TODO
          }),
        ],
      ),
    );
  }

  // ---------------- PANCHANG ----------------
  Widget _panchangCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("📅 Panchang", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          Text("December 2025"),
          SizedBox(height: 6),
          Text(
            "Auspicious timings & calendar information",
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }

  // ---------------- HELPERS ----------------
  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.05),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  Widget _gradientButton(String text, IconData icon, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _outlinedButton(String text, IconData icon, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, color: Colors.deepOrange),
        label: Text(text),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
