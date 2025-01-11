enum Weekday {MO, DI, MI, DO, FR}

var mensaOfnnungszeit = [2, 5];  // experimental, Zeit in DS

void main() {
  Map<Weekday, List<String>> student1 = {
    Weekday.MO: ["", "", "VL: Mathe", "Ü: Seminargruppe", "", ""],
    Weekday.DI: ["", "", "", "", "", ""],
    Weekday.MI: ["", "Ü: EMI", "VL: Mathe", "Ü: AUD", "", ""],
    Weekday.DO: ["Ü: Mathe", "Ü: Mathe", "VL: EMI", "", "", ""],
    Weekday.FR: ["", "VL: AUD", "VL: Mathe", "", "", ""],
  };

  Map<Weekday, List<String>> student2 = {
    Weekday.MO: ["VL: Mathe", "Ü: Seminargruppe", "", "", "", ""],
    Weekday.DI: ["", "", "", "", "", ""],
    Weekday.MI: ["Ü: EMI", "", "VL: Mathe", "", "Ü: Mathe", "Ü: AuD"],
    Weekday.DO: ["", "", "VL: EMI", "", "", ""],
    Weekday.FR: ["", "VL: AUD", "VL: Mathe", "", "", ""],
  };

  Weekday day = Weekday.MO;

  printWeekSchedule(student1);
  print("\n-------------------------------\n");

  printDaySchedule(student1, day);
  print("\n-------------------------------\n");

  printWhenMensa(student1, student2, day);
}

// Gibt den Wochenplan eines Studenten in DS-Format aus.
void printWeekSchedule(Map<Weekday, List<String>> student) {
  print("Week schedule:");
  // Iteration über jeden Wochentag im Stundenplan
  student.forEach((key, value) {
    print("Day: $key");
    // Flag zur Überprüfung, ob der Tag leer ist
    bool isEmpty = true;
    // Iteration über die einzelnen Doppelstunden (DS)
    for (int i = 0; i < value.length; i++) {
      if (value[i] != "") {
        // Ausgabe der belegten DS mit Fachname
        print("${i + 1}. DS, Subject: ${value[i]}");
        isEmpty = false;
      }
    }
    // Wenn keine Fächer an diesem Tag vorhanden sind
    if (isEmpty) {
      print("No subjects");
    }
  });
}

// Gibt den Tagesplan eines Studenten für einen bestimmten Tag aus.
void printDaySchedule(Map<Weekday, List<String>> student, Weekday day) {
  print("Day schedule:");
  print("Day: $day");
  // Stundenplan für den angegebenen Tag abrufen
  List<String>? value = student[day];
  // Flag zur Überprüfung, ob der Tag leer ist
  bool isEmpty = true;
  // Iteration über die Doppelstunden des Tages
  for (int i = 0; i < value!.length; i++) {
    if (value[i] != "") {
      // Ausgabe der belegten DS mit Fachname
      print("${i + 1}. DS, Subject: ${value[i]}");
      isEmpty = false;
    }
  }
  // Wenn keine Fächer an diesem Tag vorhanden sind
  if (isEmpty) {
    print("No subjects");
  }
}

/// Vergleicht die Stundenpläne zweier Studenten für einen bestimmten Tag.
/// Bestimmt die DS-Zeitfenster, in denen beide Studenten während der Mensa-Öffnungszeiten frei sind.
void printWhenMensa(Map<Weekday, List<String>> student1, Map<Weekday, List<String>> student2, Weekday day) {
  print("When can we go in Mensa together?");
  print("Day: $day");
  
  // Stundenplan für den gegebenen Tag für Student 1 abrufen
  List<String>? value1 = student1[day];
  // Stundenplan für den gegebenen Tag für Student 2 abrufen
  List<String>? value2 = student2[day];
  
  // Flag, um festzustellen, ob gemeinsame freie Zeiten gefunden wurden
  bool isEmpty = true;

  // Iteration durch die Zeiträume (DS) des Tages
  for (int i = 0; i < value1!.length; i++) {
    // Überprüfen, ob beide Studenten frei sind und die Mensa geöffnet ist
    if (value1[i] == "" && value2![i] == "" && i >= mensaOfnnungszeit[0] && i < mensaOfnnungszeit[1]) {
      // Zeitfenster ausgeben, in dem beide in die Mensa gehen können
      print("${i + 1}. DS: We can go in Mensa together");
      isEmpty = false;
    }
  }

  // Falls keine gemeinsamen freien Zeiten gefunden wurden
  if (isEmpty) {
    print("We can't go today in Mensa together");
  }
}