import 'package:intl/intl.dart';

foramteDate(String date) {
    DateTime dateTime = DateTime.parse(date);

    // Format the date
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);
    print(formattedDate);

    return formattedDate; // Output: 2024-07-26 – 23:03
  }