import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDate(String? date) {
    if (date != null || date!.isEmpty) return '';
    try {
      final DateTime dateTime = DateTime.parse(date);
      return DateFormat.yMMMd('pt_Br').format(dateTime);
    } catch (e) {
      return '';
    }
  }
}
