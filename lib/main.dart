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
                final Uri url = Uri.parse('https://bildungsportal.sachsen.de/opal/');
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
              onTap: () async {
                final Uri url = Uri.parse('https://msx.tu-dresden.de');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
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
              onTap: () async {
                final Uri url = Uri.parse('https://selma.tu-dresden.de/');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
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
              onTap: () async {
                final Uri url = Uri.parse('https://matrix.tu-dresden.de/');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
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

class Mensa extends StatelessWidget {
  const Mensa({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class DoppelStundeWidget extends StatelessWidget {
  final String time;
  final String label;
  final String room;

  const DoppelStundeWidget({
    super.key,
    required this.time,
    required this.label,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.0,
      height: 100.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 30.0,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.access_time,
                  size: 16.0,
                  color: Colors.white,
                ),
                const SizedBox(width: 4.0),
                Text(
                  time,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(8.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  if (room.isNotEmpty)
                    Text(
                      room,
                      style: const TextStyle(
                        fontSize: 10.0,
                        color: Colors.grey,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class Stundenplan extends StatelessWidget {
  const Stundenplan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              DoppelStundeWidget(time: '7:30', label: 'Zem', room: 'APB Zem 001'),
              DoppelStundeWidget(time: '9:20', label: 'frei', room: ''),
              DoppelStundeWidget(time: '11:10', label: 'Diskrete Artem', room: 'HSZ Agent 007'),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              DoppelStundeWidget(time: '13:00', label: 'Mensa', room: ''),
              DoppelStundeWidget(time: '14:50', label: 'AUD (AFD) Ü', room: 'APB EBA001'),
              DoppelStundeWidget(time: '16:20', label: 'frei', room: ''),
            ],
          ),
        ],
      ),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          Mensa(),
          SizedBox(height: 16.0),
          Stundenplan(),
        ],
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  final Function(int) onItemSelected;
  final int index;

  const CustomDrawer({super.key, required this.onItemSelected, required this.index});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Study-App Navigator', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            title: const Text('Home'),
            selected: index == 0,
            selectedColor: Colors.amber[800],
            onTap: () {
              onItemSelected(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Stundenplan'),
            selectedColor: Colors.amber[800],
            selected: index == 1,
            onTap: () {
              onItemSelected(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('ToDO'),
            selectedColor: Colors.amber[800],
            selected: index == 2,
            onTap: () {
              onItemSelected(2);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Credits:\nFam Dyk An \nMatrikelnummer: 5264779 dykanfam@gmail.com\n\n'
                'Artem Kyryllov \nMatrikelnummer: 5202221 artem.kirillov160805@gmail.com\n\n'
                'Konstantin Grigoryev \nMatrikelnummer: 5269096 kosttyagr@gmail.com'),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  int currentPageIndex = 0;

  void _updateSelectedIndex(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue.shade900,
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: 'Show Navigation Menu',
              );
            },
          ),
          title: const Text('Study-App'),
          backgroundColor: Colors.blue.shade800,
        ),
        body: [Dashboard(),Mensa(),Stundenplan()][currentPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Stundenplan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'ToDO',
            ),
          ],
          onTap: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          currentIndex: currentPageIndex,
          selectedItemColor: Colors.amber[800],
        ),
        drawer: CustomDrawer(onItemSelected: _updateSelectedIndex, index: currentPageIndex),
      ),
    );
  }
}
