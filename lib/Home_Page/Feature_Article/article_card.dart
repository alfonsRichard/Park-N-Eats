import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const ArticleCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl, width: double.infinity, height: 150, fit: BoxFit.cover),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 5),
            Text(description),
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
          description: 'Plan your dream trip with a Getaway Deal',
          imageUrl: 'assets/img/jatim1.jpg',
        ),
        ArticleCard(
          title: 'Jatim Park 2',
          description: 'Plan your dream trip with a Getaway Deal',
          imageUrl: 'assets/img/jatim1.jpg',
        ),
        ArticleCard(
          title: 'KFC',
          description: 'Plan your dream trip with a Getaway Deal',
          imageUrl: 'assets/img/kfc.jpg',
        ),
        // Add more ArticleCards as needed
      ],
    );
  }
}
