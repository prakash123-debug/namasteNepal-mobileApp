import 'package:intl/intl.dart';

String dateFormatter(DateTime dateTime) {
  var format = DateFormat("yyyy-mm-dd");
  String date = format.format(dateTime);
  print(date);
  return date;
}
