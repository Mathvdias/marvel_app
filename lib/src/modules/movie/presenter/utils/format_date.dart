import 'package:intl/intl.dart';

extension MattExtension on String {
  String getFormattedDate() {
    var localDate = DateTime.parse(this).toLocal();
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(localDate.toString());
    var outputFormat = DateFormat('dd/MM/yyyy');
    var outputDate = outputFormat.format(inputDate);
    return outputDate.toString();
  }
}
