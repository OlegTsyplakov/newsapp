import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class StringHelpers {

  static String stripHtml(String text) {
    String br = "<br>";
    text = text.replaceAll(br, '\n');
    return text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ');
  }

  static String dateFormat(String? text) {
    if (text == null) {
      return "";
    }
    initializeDateFormatting();
    text = text.replaceAllMapped(RegExp(r".{2}"), (match) => "${match.group(0)} ");
    DateTime dt = DateFormat('dd MM yy HH mm', 'ru').parse(text);
    return DateFormat.yMMMd("ru").add_jm().format(dt).toString();
  }
}
