import 'package:flutter/material.dart';
import 'Feature_Rewards/rewardpage.dart';
import 'Feature_Notes/notes.dart';
import 'Feature_TopUp/topuppage.dart';
import 'Feature_Article/article_card.dart';
import 'Feature_History/historypage.dart';
import 'package:myapp/navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // This removes the back button
        titleTextStyle: const TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text(
                        'Hi, Salsa',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.waving_hand, color: Colors.orange, size: 24),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.shopping_cart, color: Color.fromARGB(255, 97, 94, 252), size: 35),
                    onPressed: () {
                      // Add your onPressed code here!
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 97, 94, 252),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star_rounded, color: Colors.white, size: 23),
                              SizedBox(width: 5),
                              Text(
                                'Points',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '100 Points',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 97, 94, 252),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.monetization_on, color: Colors.white, size: 23),
                              SizedBox(width: 5),
                              Text(
                                'Balance',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Rp 150.000',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.red,
                        child: IconButton(
                          icon: const Icon(Icons.redeem, color: Colors.white, size: 35),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const RewardsPage()),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text('Rewards', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blue,
                        child: IconButton(
                          icon: const Icon(Icons.add_circle_outline, color: Colors.white, size: 35),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const TopUpPage()),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text('Top Up', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.orange,
                        child: IconButton(
                          icon: const Icon(Icons.note_alt_rounded, color: Colors.white, size: 30),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const NotesPage()),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text('Notes', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.purple,
                        child: IconButton(
                          icon: const Icon(Icons.history_rounded, color: Colors.white, size: 35),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HistoryPage()),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text('History', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Article For You',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const ArticleList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: _currentIndex), // Use the custom navbar
    );
  }
}
