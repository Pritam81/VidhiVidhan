import 'package:flutter/material.dart';

class CustomerDashboard extends StatelessWidget {
  const CustomerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome Back, Sarthak! 🙏",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            _quickActions(),
            const SizedBox(height: 24),

            _servicesGrid(),
            const SizedBox(height: 24),

            _panditsNearYou(),
            const SizedBox(height: 24),

            _mantraCard(),
            const SizedBox(height: 16),

            _pujaCard(),
            const SizedBox(height: 24),

            _panchang(),
          ],
        ),
      ),
    );
  }

  // ---------------- APP BAR ----------------
  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        "Divine Pandit",
        style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none, color: Colors.black),
          onPressed: () => print("Notifications clicked"),
        ),
        IconButton(
          icon: const Icon(Icons.settings, color: Colors.black),
          onPressed: () => print("Settings clicked"),
        ),
        const CircleAvatar(
          backgroundColor: Colors.orange,
          child: Text("SN", style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(width: 12),
      ],
    );
  }

  // ---------------- QUICK ACTIONS ----------------
  Widget _quickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Quick Actions",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),

        _primaryButton("Explore Services", () => print("Explore Services")),
        const SizedBox(height: 10),
        _outlineButton("Family Tree", () => print("Family Tree")),
        const SizedBox(height: 10),
        _outlineButton("My Bookings", () => print("My Bookings")),
      ],
    );
  }

  // ---------------- SERVICES GRID ----------------
  Widget _servicesGrid() {
    final services = [
      "Find Astrologer",
      "Explore Pujas",
      "Kundli Matching",
      "Temple Darshan",
      "Explore Dharma",
      "Traditional Geets",
      "Vastu Shastra",
      "Daily Horoscope",
      "Puja Samagri",
      "Numerology",
      "Muhurat",
      "Festivals",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Our Services",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: services.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (_, index) => InkWell(
            onTap: () => print("${services[index]} clicked"),
            borderRadius: BorderRadius.circular(16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  services[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ---------------- PANDITS LIST ----------------
  Widget _panditsNearYou() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Available Pandits Near You",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),

        _panditCard("Pandit Sharma Ji", "Mumbai", "₹2,500", 4.9),
        _panditCard("Pandit Verma Ji", "Delhi", "₹3,000", 4.8),
        _panditCard("Pandit Mishra Ji", "Bangalore", "₹2,000", 4.7),
      ],
    );
  }

  Widget _panditCard(String name, String city, String price, double rating) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(city),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("⭐ $rating"),
              Text(price, style: const TextStyle(color: Colors.orange)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => print("Contact $name"),
                  child: const Text("Contact"),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => print("Book $name"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text("Book Now"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  // ---------------- MANTRA ----------------
  Widget _mantraCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.deepOrange, Colors.orange],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Mantra of the Day",
              style: TextStyle(color: Colors.white, fontSize: 16)),
          SizedBox(height: 8),
          Text("ॐ गं गणपतये नमः",
              style:
                  TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text("Om Gam Ganapataye Namaha",
              style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }

  // ---------------- PUJA ----------------
  Widget _pujaCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Text("Puja of the Day",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text("Ganesh Puja"),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => print("Learn More Puja"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
            ),
            child: const Text("Learn More"),
          ),
        ],
      ),
    );
  }

  // ---------------- PANCHANG ----------------
  Widget _panchang() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Panchang",
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text("December 2025"),
          SizedBox(height: 8),
          Text("Auspicious timings and calendar info"),
        ],
      ),
    );
  }

  // ---------------- BUTTON HELPERS ----------------
  Widget _primaryButton(String text, VoidCallback onTap) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(text),
    );
  }

  Widget _outlineButton(String text, VoidCallback onTap) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(text),
    );
  }
}
