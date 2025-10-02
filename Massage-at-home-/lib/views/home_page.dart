import 'package:flutter/material.dart';
import 'hello_stateless.dart';
import 'hello_stateful.dart';
import 'grid_page.dart';
import 'material_cupertino_demo.dart';
import 'booking_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HelloStateless(),
    const HelloStateful(),
    const GridPage(),
    const MaterialCupertinoDemo(),
    const BookingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Massage at Home Service")),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Text("Menu",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            ListTile(
              title: const Text("Hello Stateless"),
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              title: const Text("Hello Stateful + Counter"),
              onTap: () => _onItemTapped(1),
            ),
            ListTile(
              title: const Text("Massage Services Grid"),
              onTap: () => _onItemTapped(2),
            ),
            ListTile(
              title: const Text("Material & Cupertino Demo"),
              onTap: () => _onItemTapped(3),
            ),
            ListTile(
              title: const Text("Booking Page"),
              onTap: () => _onItemTapped(4),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.teal,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Stateless"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Stateful"),
          BottomNavigationBarItem(icon: Icon(Icons.grid_on), label: "Services"),
          BottomNavigationBarItem(
              icon: Icon(Icons.phone_iphone), label: "Cupertino"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Booking"),
        ],
      ),
    );
  }
}
