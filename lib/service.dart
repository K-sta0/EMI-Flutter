import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'main.dart';

enum Weekday {
  MO('Montag'), DI('Dienstag'), MI('Mittwoch'), DO('Donnerstag'), FR('Freitag'),
      SA('Samstag'), SO('Sonntag');

  final String abbreviation;
  const Weekday(this.abbreviation);

  Weekday operator +(int other) {
    int result = (index + other) % 7;
    return Weekday.values[result];
  }
}

class Service {
  Map<Weekday, List<List<String>>> schedule = {
    Weekday.MO: [
      ["", "", ""],
      ["", "", ""],
      ["VL:Mathe", "HSZ 001", "Prof. Dr. Manuel Bodirsky"],
      ["Ü:Seminargruppe", "APB 003", "Dr. Fischer"],
      ["", "", ""],
      ["", "", ""],
    ],
    Weekday.DI: [
      ["", "", ""],
      ["", "", ""],
      ["", "", ""],
      ["", "", ""],
      ["", "", ""],
      ["", "", ""],
    ],
    Weekday.MI: [
      ["", "", ""],
      ["Ü:EMI", "HSZ 002", "Prof. Dr. rer. nat. habil. Gerhard Weber"],
      ["VL:Mathe", "HSZ 003", "Dr. Manuel Bodirsky"],
      ["Ü:AUD", "SE2/0102/U", "Dr. Schmidt"],
      ["", "", ""],
      ["", "", ""],
    ],
    Weekday.DO: [
      ["Ü:Mathe", "SE1/0102/U", "Dr. Fischer"],
      ["Ü:Mathe", "SE2/0205/U", "Dr. Miner"],
      ["VL:EMI", "APB 202", "Prof. Dr. rer. nat. habil. Gerhard Weber"],
      ["", "", ""],
      ["", "", ""],
      ["", "", ""],
    ],
    Weekday.FR: [
      ["", "", ""],
      ["VL:AUD", "HSZ 004", "Prof. Lang"],
      ["VL:Mathe", "HSZ 001", "Dr. Manuel Bodirsky"],
      ["", "", ""],
      ["", "", ""],
      ["", "", ""],
    ],
    Weekday.SA: [
      ["", "", ""],
      ["", "", ""],
      ["", "", ""],
      ["", "", ""],
      ["", "", ""],
      ["", "", ""],
    ],
    Weekday.SO: [
      ["", "", ""],
      ["", "", ""],
      ["", "", ""],
      ["", "", ""],
      ["", "", ""],
      ["", "", ""],
    ],
  };

  Weekday getWeekday(DateTime date) {
    const dayMapping = {
      "Montag": Weekday.MO,
      "Dienstag": Weekday.DI,
      "Mittwoch": Weekday.MI,
      "Donnerstag": Weekday.DO,
      "Freitag": Weekday.FR,
      "Samstag": Weekday.SA,
      "Sonntag": Weekday.SO,
    };

    String normalizedDay = getDayFromDate(date);

    return dayMapping.entries
        .firstWhere(
          (entry) => entry.key.toLowerCase() == normalizedDay.toLowerCase(),
    ).value;
  }

  String getDateString(DateTime date) {
    initializeDateFormatting('de_DE', null);
    String formattedDate = DateFormat('EEEE, d. MMMM', 'de_DE').format(date);
    return formattedDate;
  }

  String getDayFromDate(date) {
    initializeDateFormatting('de_DE', null);
    String formattedDay = DateFormat('EEEE', 'de_DE').format(date);
    return formattedDay;
  }

  DateTime getStatedDate(DateTime date, int state) {
    if (state > 0) {
      return date = date.add(Duration(days: state));
    }
    else if (state < 0) {
      return date = date.subtract(Duration(days: state.abs()));
    }
    return date;
  }

  List<List<String>> getDaySchedule(Weekday day) {
    return schedule[day]!;
  }
}


class TodoState with ChangeNotifier {
  Map<int, Map<String, bool>> _todayTodos = {
    0: {"Beispiel für heute": true},
  };

  Map<int, Map<String, bool>> _tomorrowTodos = {
    0: {"Beispiel für morgen": true},
  };

  Map<int, Map<String, bool>> _dayAfterTomorrowTodos = {
    0: {"Beispiel für übermorgen 1": true},
    1: {"Beispiel für übermorgen 2": true},
  };

  TodoDay _selectedDay = TodoDay.HE;

  // Getters for each day
  Map<int, Map<String, bool>> get todayTodos => _todayTodos;
  Map<int, Map<String, bool>> get tomorrowTodos => _tomorrowTodos;
  Map<int, Map<String, bool>> get dayAfterTomorrowTodos => _dayAfterTomorrowTodos;
  TodoDay get selectedDay => _selectedDay;

  void setSelectedDay(TodoDay day) {
    _selectedDay = day;
    notifyListeners();
  }

  // Methods to update the todos for each day
  void deleteTodo(TodoDay day, int index) {
    switch (day) {
      case TodoDay.HE:
        _todayTodos.remove(index);
        break;
      case TodoDay.MO:
        _tomorrowTodos.remove(index);
        break;
      case TodoDay.UB:
        _dayAfterTomorrowTodos.remove(index);
        break;
    }
    notifyListeners();
  }

  void setCompleted(TodoDay day, int index, String key) {
    switch (day) {
      case TodoDay.HE:
        _todayTodos[index]!.update(key, (value) => !value);
        break;
      case TodoDay.MO:
        _tomorrowTodos[index]!.update(key, (value) => !value);
        break;
      case TodoDay.UB:
        _dayAfterTomorrowTodos[index]!.update(key, (value) => !value);
        break;
    }
    notifyListeners();
  }

  void changeToDO(TodoDay day, int index, String newTodo) {
    switch (day) {
      case TodoDay.HE:
        _todayTodos[index] = {newTodo: true};
        break;
      case TodoDay.MO:
        _tomorrowTodos[index] = {newTodo: true};
        break;
      case TodoDay.UB:
        _dayAfterTomorrowTodos[index] = {newTodo: true};
        break;
    }
    notifyListeners();
  }

  void addTodo(TodoDay selectedDay, String inputText) {
    int i = 0;
    switch (selectedDay) {
      case TodoDay.HE:
        while (_todayTodos.containsKey(i)) {
          i++;
        }
        _todayTodos[i] = {inputText: true};
        break;
      case TodoDay.MO:
        while (_tomorrowTodos.containsKey(i)) {
          i++;
        }
        _tomorrowTodos[i] = {inputText: true};
        break;
      case TodoDay.UB:
        while (_dayAfterTomorrowTodos.containsKey(i)) {
          i++;
        }
        _dayAfterTomorrowTodos[i] = {inputText: true};
        break;
    }
    notifyListeners();
  }
}