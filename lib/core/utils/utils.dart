import 'package:intl/intl.dart';

enum LoadingState { loading, loaded, error, empty }

extension DateFormatExtension on DateTime {
  String get formattedDate {
    return DateFormat('MMMM dd,yyyy').format(this);
  }
}
