// everything is fine but in student reports it says bottom overflowed by 1.4 pixel solve it

import 'package:flutter/material.dart';
import '../login/google_login_handler.dart';
import 'get_reports_page.dart';

// class AdminDashboard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Admin Dashboard',
//       theme: ThemeData(
//         primaryColor: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: AdminDashboard(),
//     );
//   }
// }

class AdminDashboard extends StatefulWidget {
  final ValueNotifier userCredential;
  final int block;
  const AdminDashboard({super.key, required this.userCredential, required this.block});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: Colors.orange, // Stylish app bar color
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings page or open settings modal
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: const Color.fromARGB(255, 225, 187, 231),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text("LPU"),
                accountEmail: Text("abc@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Text(
                    "L",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Settings"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.contacts),
                title: const Text("Contact Us"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("LogOut"),
                onTap: () async {
                  Navigator.pop(context); //routes
                  bool result = await signOutFromGoogle();
                  if (result) widget.userCredential.value = '';
                },
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Block ${widget.block}',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: <Widget>[
                  // In DashboardCard where you define the 'Student Reports' card
                  DashboardCard(
                    icon: Icons.report,
                    title: 'Student Reports',
                    color: Colors.orange,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentReportPage(block: widget.block), // Now fetching reports from Firestore
                        ),
                      );
                    },
                  ),
                  DashboardCard(
                    icon: Icons.report,
                    title: 'Obligations',
                    color: const Color.fromARGB(255, 64, 182, 60),
                    onPressed: () {
                      // Navigate to student reports page
                    },
                  ),
                  DashboardCard(
                    icon: Icons.event_note,
                    title: 'Events',
                    color: Colors.purple,
                    onPressed: () {
                      // Navigate to events page
                    },
                  ),
                  // Add more cards here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onPressed;

  const DashboardCard({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    required this.onPressed,
  });

  @override
  State<DashboardCard> createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) => setState(() => isPressed = false),
      onTapCancel: () => setState(() => isPressed = false),
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(isPressed ? 15 : 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [widget.color.withOpacity(0.5), widget.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: isPressed
              ? []
              : [
                  BoxShadow(
                    color: widget.color.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(widget.icon, size: 70.0, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              widget.title,
              style: const TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
