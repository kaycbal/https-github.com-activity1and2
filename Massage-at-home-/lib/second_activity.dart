import 'package:flutter/material.dart';

class SecondActivityPage extends StatefulWidget {
  const SecondActivityPage({super.key});

  @override
  State<SecondActivityPage> createState() => _SecondActivityPageState();
}

class _SecondActivityPageState extends State<SecondActivityPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF00897B), Color(0xFF004D40)], // teal shades
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, // removes white background
        appBar: AppBar(
          title: const Text("Massage At Home Services"),
          centerTitle: true,
          backgroundColor: Colors.teal[700],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.teal[700],
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.spa), label: "Services"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: _selectedIndex == 0
              ? _buildHome()
              : _selectedIndex == 1
                  ? _buildServices()
                  : _buildProfile(),
        ),
      ),
    );
  }

  // ---------------- HOME PAGE ----------------
  Widget _buildHome() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text("Available Massage Categories",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Chip(label: Text("Swedish")),
            Chip(label: Text("Thai")),
            Chip(label: Text("Shiatsu")),
          ],
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff4eb7a6),
              padding: const EdgeInsets.all(14)),
          onPressed: () {},
          child: const Text("Book Now", style: TextStyle(fontSize: 16)),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff4ab8a6),
              padding: const EdgeInsets.all(14)),
          onPressed: () {},
          child: const Text("Contact Us", style: TextStyle(fontSize: 16)),
        ),
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            "💡 Special Promo: Get 20% off for first-time customers!",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ],
    );
  }

  // ---------------- SERVICES PAGE ----------------
  Widget _buildServices() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text("Our Professional Therapists",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        const SizedBox(height: 12),

        // Female Therapist
        _therapistCard(
            "Jane Lopez",
            "Certified Massage Therapist\n⭐ 4.8 Rating",
            "https://randomuser.me/api/portraits/women/44.jpg"),

        const SizedBox(height: 12),

        // Male Therapist
        _therapistCard("Mark Santos", "Licensed Therapist\n⭐ 4.7 Rating",
            "https://randomuser.me/api/portraits/men/32.jpg"),

        const SizedBox(height: 20),

        const Text("Our Massage Packages",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        const SizedBox(height: 12),

        Column(
          children: [
            _packageCard(
                "Swedish Massage", "₱1,200", "Relaxing full-body massage"),
            _packageCard(
                "Thai Massage", "₱1,500", "Stretching & pressure points"),
            _packageCard(
                "Shiatsu Massage", "₱1,800", "Japanese acupressure therapy"),
            _packageCard(
                "Couple’s Massage", "₱2,800", "For you and your loved one"),
          ],
        ),
      ],
    );
  }

  Widget _therapistCard(String name, String subtitle, String imageUrl) {
    return Card(
      color: Colors.white.withOpacity(0.85),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading:
            CircleAvatar(radius: 28, backgroundImage: NetworkImage(imageUrl)),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xff52b1a6)),
          child: const Text("Book"),
        ),
      ),
    );
  }

  Widget _packageCard(String title, String price, String desc) {
    return Card(
      color: Colors.white.withOpacity(0.85),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.spa, color: Colors.teal, size: 32),
        title: Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        subtitle: Text(desc),
        trailing: Text(price,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 16)),
      ),
    );
  }

  // ---------------- PROFILE PAGE ----------------
  Widget _buildProfile() {
    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=12"),
        ),
        const SizedBox(height: 12),
        const Text("Joseph Cruz",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        const Text("joseph@email.com", style: TextStyle(color: Colors.white70)),
        const SizedBox(height: 20),
        ListTile(
          tileColor: Colors.white.withOpacity(0.85),
          leading: const Icon(Icons.history),
          title: const Text("Booking History"),
          onTap: () {},
        ),
        ListTile(
          tileColor: Colors.white.withOpacity(0.85),
          leading: const Icon(Icons.settings),
          title: const Text("Settings"),
          onTap: () {},
        ),
        ListTile(
          tileColor: Colors.white.withOpacity(0.85),
          leading: const Icon(Icons.logout),
          title: const Text("Logout"),
          onTap: () {},
        ),
      ],
    );
  }
}
