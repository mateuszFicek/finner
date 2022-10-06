import 'package:intl/intl.dart';

extension Format on DateTime {
  String get fullDateWithTime {
    final f = DateFormat('yyyy-MM-dd hh:mm');
    return f.format(this);
  }

  String get fullDateWithoutTime {
    final f = DateFormat('yyyy-MM-dd');
    return f.format(this);
  }
}
