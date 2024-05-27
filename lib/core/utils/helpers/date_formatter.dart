import 'package:intl/intl.dart';

/// A classe `DateFormatter` fornece métodos para formatar datas.
///
/// Atualmente, contém um método estático para formatar uma data a partir de
/// uma string e retorná-la no formato local 'pt_BR'.
class DateFormatter {
  /// Formata uma string de data para o formato 'dd/MM/yyyy'.
  ///
  /// [date] é a string de data que será formatada. A string de entrada deve estar
  /// no formato ISO 8601 (yyyy-MM-ddTHH:mm:ss.sssZ). Se a string de data for nula ou vazia,
  /// o método retornará uma string vazia.
  ///
  /// Retorna a data formatada como uma string no formato 'dd/MM/yyyy'. Se a string
  /// de entrada não puder ser analisada como uma data válida, o método retornará uma
  /// string vazia.
  ///
  /// Exemplos de uso:
  /// ```dart
  /// String formattedDate = DateFormatter.formatDate('2023-05-22');
  /// print(formattedDate); // '22 de mai de 2023'
  /// ```
  static String formatDate(String? date) {
    // Verifica se a string de data é nula ou vazia
    if (date == null || date.isEmpty) return '';
    try {
      // Tenta analisar a string de data em um objeto DateTime
      final DateTime dateTime = DateTime.parse(date);
      // Formata o objeto DateTime no formato 'dd/MM/yyyy'
      return DateFormat.yMMMd('pt_BR').format(dateTime);
    } catch (e) {
      // Retorna uma string vazia se ocorrer um erro na análise ou formatação
      return '';
    }
  }
}
