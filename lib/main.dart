import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'service.dart';

void main() {
  runApp(MyApp());
}

class Notification extends StatefulWidget {
  const Notification({super.key});

  @override
  NotificationState createState() => NotificationState();
}

class NotificationState extends State<Notification> {
  bool _isVisible = true;

  void _closeNotification() {
    setState(() {
      _isVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Text(
                'Die Einschreibung für mündliche Prüfungen hat begonnen und endet am 21.01.2025.',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
                height: 24.0,
                width: 24.0,
                child: IconButton(
                  padding: EdgeInsets.all(2.0),
                  color: Colors.white,
                  icon: Icon(Icons.clear, size: 16.0),
                  onPressed: _closeNotification,
                )
            ),
          ],
        ),
      ),
    );
  }
}


class Date extends StatelessWidget {
  const Date({super.key});

  @override
  Widget build(BuildContext context) {
    final dateString = Service().getDate();

    return Center(
      child: Text(
        dateString,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class FastNavigation extends StatelessWidget {
  const FastNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            InkWell(
              onTap: () async {
                final Uri url = Uri.parse('https://google.com');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              borderRadius: BorderRadius.circular(8.0), // Optional for rounded corners
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(15.0), // Optional padding
                child: const Icon(Icons.attach_file, color: Colors.white),
              ),
            ),
            const SizedBox(height: 8.0),
            const Text('OPAL', style: TextStyle(color: Colors.white)),
          ],
        ),
        SizedBox(width: 40),
        Column(
          children: [
            InkWell(
              onTap: () {
                // Handle the button tap action
              },
              borderRadius: BorderRadius.circular(8.0), // Optional for rounded corners
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(15.0), // Optional padding
                child: const Icon(Icons.mail, color: Colors.white),
              ),
            ),
            const SizedBox(height: 8.0),
            const Text('Mail', style: TextStyle(color: Colors.white)),
          ],
        ),
        SizedBox(width: 40),
        Column(
          children: [
            InkWell(
              onTap: () {
                // Handle the button tap action
              },
              borderRadius: BorderRadius.circular(8.0), // Optional for rounded corners
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(15.0), // Optional padding
                child: const Icon(Icons.delete, color: Colors.white),
              ),
            ),
            const SizedBox(height: 8.0),
            const Text('Selma', style: TextStyle(color: Colors.white)),
          ],
        ),
        SizedBox(width: 40),
        Column(
          children: [
            InkWell(
              onTap: () {
                // Handle the button tap action
              },
              borderRadius: BorderRadius.circular(8.0), // Optional for rounded corners
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(15.0), // Optional padding
                child: const Icon(Icons.calculate, color: Colors.white),
              ),
            ),
            const SizedBox(height: 8.0),
            const Text('Matrix', style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
    );
  }
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
              Notification(),
              const SizedBox(height: 16.0),
              Date(),
              const SizedBox(height: 16.0),
              FastNavigation(),
              const SizedBox(height: 16.0),
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