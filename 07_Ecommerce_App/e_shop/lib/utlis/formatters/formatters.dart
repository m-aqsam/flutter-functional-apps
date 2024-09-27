import 'package:intl/intl.dart';

class EFormastters {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    {
      return DateFormat('dd-MMM-yyyy ').format(date);
    } // Customize the date format as needed
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    // Assuming a 10-digit US phone number format: (123) 456-7890
    if (phoneNumber.length == 10) {
      return ' (${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return ' (${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}';
    }

    // Add more Conditions if required according to phone formats
    return phoneNumber;
  }
}
