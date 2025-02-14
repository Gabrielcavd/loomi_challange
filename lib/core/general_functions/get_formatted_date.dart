import 'package:get/get.dart';
import 'package:intl/intl.dart';

String getFormattedDate(DateTime date) {
  final DateFormat formatter = DateFormat('MMM dd, yyyy', 'pt_BR');
  String dateFormatted = formatter.format(date);

  return dateFormatted.capitalize!;
}
