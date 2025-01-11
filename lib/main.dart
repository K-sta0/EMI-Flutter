import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      width: 100.0, 
      height: 100.0, 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Полоса
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
                //Отступ между иконкой и временем
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
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2.0,
                    spreadRadius: 1.0,
                  ),
                ],
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



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue.shade900,
        appBar: AppBar(
          title: const Text('Study-App'),
          backgroundColor: Colors.blue.shade800,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  [
              Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.only(bottom: 16.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  'Die Einschreibung für mündliche Prüfungen hat begonnen und endet am 21.01.2025.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ),
              Mensa(), 
              SizedBox(height: 16.0), 
              Stundenplan(), 
            ],
          ),
        ),
      ),
    );
  }
}
