import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Service {
  String getDate() {
    initializeDateFormatting('de_DE', null);
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, d. MMMM', 'de_DE').format(now);
    return formattedDate;
  }
}