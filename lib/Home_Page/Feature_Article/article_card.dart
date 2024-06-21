import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const ArticleCard({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageUrl,
              width: 150,  // Adjust the width as per your requirement
              height: 100, // Adjust the height as per your requirement
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 97, 94, 252),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: const Text('View More'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleList extends StatelessWidget {
  const ArticleList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const <Widget>[
        ArticleCard(
          title: 'Jatim Park 1',
          imageUrl: 'assets/img/jatim1.jpg',
        ),
        ArticleCard(
          title: 'Jatim Park 2',
          imageUrl: 'assets/img/jatim2.jpg',
        ),
        ArticleCard(
          title: 'Jatim Park 3',
          imageUrl: 'assets/img/jatim3.jpg',
        ),
        ArticleCard(
          title: 'KFC',
          imageUrl: 'assets/img/kfc.jpg',
        ),
        // Add more ArticleCards as needed
      ],
    );
  }
}
