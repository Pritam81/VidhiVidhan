import 'package:flutter/material.dart';

class PanditDashboard extends StatefulWidget {
  const PanditDashboard({super.key});

  @override
  State<PanditDashboard> createState() => _PanditDashboardState();
}

class _PanditDashboardState extends State<PanditDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6EB),

      // -------------------- APP BAR ----------------------
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF9F6EB),
        title: Row(
          children: [
            // const SizedBox(width: 12),
            Image.asset("assets/images/omlogo.jpg", height: 32),
            const SizedBox(width: 8),
            const Text(
              "Divine Pandit",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.orange,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              backgroundColor: Colors.purple.shade300,
              child: const Text("PS"),
            ),
          ),
        ],
      ),

      // -------------------- BODY ----------------------
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---------------- Greeting -----------------
              const Text(
                "Namaste, Pandit Sharma Ji!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text(
                "🙏\nManage your bookings and schedule",
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 20),

              // ---------------- METRICS GRID -----------------
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.2,
                children: [
                  metricsCard(
                    icon: Icons.calendar_month_rounded,
                    value: "47",
                    title: "Total Bookings",
                    iconColor: Colors.red,
                  ),
                  metricsCard(
                    icon: Icons.calendar_today_rounded,
                    value: "12",
                    title: "This Month",
                    iconColor: Colors.orange,
                  ),
                  metricsCard(
                    icon: Icons.event_available_rounded,
                    value: "4",
                    title: "Upcoming",
                    iconColor: Colors.amber.shade800,
                  ),
                  metricsCard(
                    icon: Icons.currency_rupee_rounded,
                    value: "₹1.2L",
                    title: "Earnings",
                    iconColor: Colors.green,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // ---------------- My Bookings Title -----------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "My Bookings",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: const [
                        Text(
                          "View All",
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              bookingCard(
                name: "Satyanarayan Puja",
                customer: "Rajesh Kumar",
                price: "₹2,500",
                date: "25 Dec 2025",
                time: "10:00 AM (2–3 hours)",
                address:
                    "Flat 304, Shanti Apartments, Andheri West, Mumbai - 400058",
                phone: "+91 98765 43210",
              ),

              const SizedBox(height: 12),

              bookingCard(
                name: "Griha Pravesh",
                customer: "Priya Sharma",
                price: "₹3,000",
                date: "28 Dec 2025",
                time: "08:00 AM (2–3 hours)",
                address:
                    "Villa 12, Green Valley Society, Powai, Mumbai - 400076",
                phone: "+91 99887 65432",
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

// =======================================================
// METRICS CARD WIDGET
// =======================================================
Widget metricsCard({
  required IconData icon,
  required String value,
  required String title,
  required Color iconColor,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    padding: const EdgeInsets.all(14),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: iconColor.withOpacity(0.15),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        Text(title, style: const TextStyle(fontSize: 13)),
        Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

// =======================================================
// BOOKING CARD
// =======================================================
Widget bookingCard({
  required String name,
  required String customer,
  required String date,
  required String time,
  required String address,
  required String phone,
  required String price,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    padding: const EdgeInsets.all(14),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title + price + status
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  customer,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text(
                    "Confirmed",
                    style: TextStyle(fontSize: 12, color: Colors.green),
                  ),
                ),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 12),

        // date
        Row(
          children: [
            const Icon(Icons.calendar_today, size: 14),
            const SizedBox(width: 6),
            Text(date, style: const TextStyle(fontSize: 13)),
          ],
        ),

        const SizedBox(height: 6),

        // Time
        Row(
          children: [
            const Icon(Icons.access_time, size: 14),
            const SizedBox(width: 6),
            Text(time, style: const TextStyle(fontSize: 13)),
          ],
        ),

        const SizedBox(height: 12),

        // Address
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.orange.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, size: 16),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(address, style: const TextStyle(fontSize: 13)),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(Icons.phone, size: 16),
                  const SizedBox(width: 6),
                  Text(phone, style: const TextStyle(fontSize: 13)),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Buttons
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("View Details"),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.orange),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "ContactCustomer",
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
