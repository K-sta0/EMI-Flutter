import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue.shade900,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.list),
            tooltip: 'Show Navigation Menu',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')));
              }
            ),
          actions: [
            IconButton(
            icon: const Icon(Icons.account_circle),
            tooltip: 'Show Navigation Menu',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')));
              })
            ],
          title: const Text('Study-App'),
          backgroundColor: Colors.blue.shade800,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Mitteilung
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  'Die Einschreibung für mündliche Prüfungen hat begonnen und endet am 21.01.2025.',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16.0),

              // Mensa 
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mensa',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Text('Wann? 4.DS'),
                    const Text('Wo? Alte Mensa'),
                    const SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Zum Angebot'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),

              // Stundenplan
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Heute',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ), 
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Zem', style: TextStyle(fontSize: 16.0)),
                        Text('Pamagiti', style: TextStyle(fontSize: 16.0)),
                        Text('Vietnam', style: TextStyle(fontSize: 16.0)),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Help me', style: TextStyle(fontSize: 16.0)),
                        Text('Help me pls', style: TextStyle(fontSize: 16.0)),
                        Text('Opyat Vietnam', style: TextStyle(fontSize: 16.0)),
                      ],
                    ),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}