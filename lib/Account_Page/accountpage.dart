import 'package:flutter/material.dart';
import 'package:myapp/navbar.dart';
import 'package:myapp/Account_Page/ProfileUserPage.dart';
import 'package:myapp/Home_Page/Feature_TopUp/topuppage.dart';
import 'package:myapp/Home_Page/Feature_Rewards/rewardpage.dart';
import 'package:myapp/onboarding.dart'; // Import the onboarding page

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Add this line to remove the back arrow
        title: const Text('Account Page'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 50),
            ),
            const SizedBox(height: 10),
            const Text(
              'Salsa',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('Profile User'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileUserPage()),
                );
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('My Cart'),
              onTap: () {
                // Navigator.push(
                // context,
                // MaterialPageRoute(builder: (context) => const MyCartPage()),
                // );
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('My Balance'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TopUpPage()),
                );
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('My Points'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RewardsPage()),
                );
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('About'),
              onTap: () {
                // Navigator.push(
                // context,
                // MaterialPageRoute(builder: (context) => const AboutPage()),
                // );
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Logout'), // Added logout button
              onTap: () {
                _showLogoutConfirmationDialog(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: _currentIndex), // Use the custom navbar
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
            TextButton(
              child: const Text('Logout'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const OnBoarding()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
