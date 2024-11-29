import 'package:intl/intl.dart';

extension StringExt on String {
  String addCommaOnly() {
    var formatter = NumberFormat('#,###,###');

    return num.tryParse(this) != null
        ? formatter.format(int.parse(this))
        : this;
  }

  bool isEmail() {
    return RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(this);
  }
}
