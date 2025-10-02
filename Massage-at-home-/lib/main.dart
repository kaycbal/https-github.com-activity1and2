import 'package:flutter/material.dart';
import 'second_activity.dart';

void main() {
  runApp(MyApp());
}

// Root widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Massage at Home Service',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(), // starting page
    );
  }
}

// Main Home Page with Drawer
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Massage at Home Service"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Drawer Header
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),

            // Navigate to Hello World (Stateless)
            ListTile(
              leading: Icon(Icons.text_fields),
              title: Text("Hello World (Stateless)"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HelloWorldStatelessPage()),
                );
              },
            ),

            // Navigate to Hello World (Stateful)
            ListTile(
              leading: Icon(Icons.countertops),
              title: Text("Hello World (Stateful)"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HelloWorldStatefulPage()),
                );
              },
            ),

            // Navigate to Second Activity
            ListTile(
              leading: Icon(Icons.dashboard_customize),
              title: Text("Second Activity"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondActivityPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to Massage at Home Service",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeContentPage()),
                );
              },
              icon: Icon(Icons.spa),
              label: Text("View Massage Services"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Page 1: Massage Service
class HomeContentPage extends StatelessWidget {
  final List<Map<String, String>> services = [
    {
      "title": "Swedish Massage",
      "description":
          "Gentle full-body massage to improve circulation and relax muscles.",
      "duration": "60 minutes"
    },
    {
      "title": "Shiatsu Massage",
      "description":
          "Japanese technique using finger pressure to restore energy balance.",
      "duration": "45 minutes"
    },
    {
      "title": "Thai Massage",
      "description":
          "Stretching and deep massage to improve flexibility and relieve stress.",
      "duration": "90 minutes"
    },
    {
      "title": "Hot Stone Massage",
      "description":
          "Heated stones placed on the body to relieve tension and boost relaxation.",
      "duration": "75 minutes"
    },
    {
      "title": "Aromatherapy Massage",
      "description":
          "Massage with essential oils for relaxation and stress relief.",
      "duration": "60 minutes"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Massage Services")),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            elevation: 4,
            child: ListTile(
              leading: Icon(Icons.spa, color: Colors.green),
              title: Text(
                services[index]["title"]!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(services[index]["description"]!),
                  SizedBox(height: 4),
                  Text(
                    "Duration: ${services[index]["duration"]}",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "Booked ${services[index]["title"]} successfully!"),
                    ),
                  );
                },
                child: Text("Book"),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Page 2: Hello World (Stateless)
class HelloWorldStatelessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello World (Stateless)")),
      body: Center(
        child: Text(
          "Hello World from StatelessWidget!",
          style: TextStyle(fontSize: 20, color: Colors.green),
        ),
      ),
    );
  }
}

// Page 3: Hello World (Stateful with Counter)
class HelloWorldStatefulPage extends StatefulWidget {
  @override
  _HelloWorldStatefulPageState createState() => _HelloWorldStatefulPageState();
}

class _HelloWorldStatefulPageState extends State<HelloWorldStatefulPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello World (Stateful)")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello World from StatefulWidget!",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            SizedBox(height: 20),
            Text(
              "Counter: $_counter",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Text("Increment Counter"),
            ),
          ],
        ),
      ),
    );
  }
}
