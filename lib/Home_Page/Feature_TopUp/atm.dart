import 'package:flutter/material.dart';

class ATMPage extends StatelessWidget {
  const ATMPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ATM'),
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
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 97, 94, 252),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Balance',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.monetization_on, color: Colors.white, size: 30),
                      SizedBox(width: 5),
                      Text(
                        'Rp 150.000,00',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              'Instruction',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 97, 94, 252)),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                '1. Enter your ATM card and PIN\n'
                '2. Select the Other Transactions menu\n'
                '3. Select the Transfer menu\n'
                '4. Select the Go to Virtual Account menu\n'
                '5. Enter 53522 + your mobile number\n'
                '6. Enter the Top Up Amount\n'
                '7. Follow the instructions to complete the transaction\n'
                '\nNotes:\n'
                '- Minimum top up IDR 10.000',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
