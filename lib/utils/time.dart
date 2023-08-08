import 'package:intl/intl.dart';

String parseTimeToRelative(DateTime time, String format) {
  final DateFormat formatter = DateFormat(format);
  return formatter.format(time);
}
