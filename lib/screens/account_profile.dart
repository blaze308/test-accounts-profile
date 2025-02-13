import 'package:flutter/material.dart';
import 'package:test/screens/update_profile.dart';

class AccountProfile extends StatelessWidget {
  const AccountProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Account",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //profile header
            Container(
              padding: const EdgeInsets.all(12),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: Text("JL", style: TextStyle(fontSize: 20)),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Jonathan Mensah",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "0244123456",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            //first section
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(children: [
                profileListTile(
                  Icons.person,
                  "Update profile",
                  onTap: () {
                    print("Navigating to Update Profile...");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UpdateProfile()),
                    );
                  },
                ),
                divider(),
                profileListTile(Icons.monitor, "Service Preference"),
                divider(),
                profileListTile(Icons.lock_clock, "Availability"),
                divider(),
                profileListTile(Icons.notifications, "Manage notifications"),
                divider(),
                profileListTile(Icons.message, "Support"),
              ]),
            ),
            const SizedBox(height: 8),
            //second section
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  profileListTile(Icons.lock, "Change Password"),
                  divider(),
                  profileListTile(Icons.warning, "Request Account deletion"),
                  divider(),
                  profileListTile(Icons.logout, "Logout", color: Colors.red),
                  divider(),
                  const ListTile(
                    leading: Icon(Icons.phone, size: 20),
                    title: Text("App Version", style: TextStyle(fontSize: 14)),
                    trailing: Text("1.0.0", style: TextStyle(fontSize: 14)),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 20), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.request_quote_sharp, size: 20),
              label: "Requests"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box, size: 20), label: "Account"),
        ],
      ),
    );
  }

  Widget profileListTile(
    IconData icon,
    String text, {
    Color color = Colors.black,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: color, size: 20),
      title: Text(text, style: TextStyle(color: color, fontSize: 14)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      onTap: onTap,
    );
  }

  Widget divider() {
    return Divider(
      indent: 10,
      endIndent: 10,
      height: 1,
      thickness: 0.5,
      color: Colors.grey.shade300,
    );
  }
}
