import 'package:get/get.dart';

class DateTimeHelper {
  static String formatTime(DateTime time) {
    String hour = time.hour.toString().padLeft(2, '0');
    String minute = time.minute.toString().padLeft(2, '0');
    String period = time.hour < 12 ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  static String formatChatDateTime(DateTime dateTime) {
    String dayName = _getDayName(dateTime.weekday);
    String hour = (dateTime.hour % 12).toString();
    String minute = dateTime.minute.toString().padLeft(2, '0');
    String period = dateTime.hour < 12 ? 'AM' : 'PM';
    return '${dayName.tr} $hour:$minute $period';
  }

  static String _getDayName(int weekday) {
    switch (weekday) {
      case 1:
        return 'sunday';
      case 2:
        return 'monday';
      case 3:
        return 'tuesday';
      case 4:
        return 'wednesday';
      case 5:
        return 'thursday';
      case 6:
        return 'friday';
      case 7:
        return 'saturday';
      default:
        return '';
    }
  }

  static String getDateFromMs(DateTime messageTime) {
    DateTime messageDate = DateTime(messageTime.year, messageTime.month, messageTime.day);
    return '${messageDate.day}/${messageDate.month}/${messageDate.year}';
  }

  static String formatMillisecondsToHourFormat(int milliseconds) {
    // Calculate total hours, minutes, and seconds
    int totalSeconds = (milliseconds / 1000).floor();
    int hours = (totalSeconds / 3600).floor();
    int minutes = ((totalSeconds % 3600) / 60).floor();
    int seconds = totalSeconds % 60;

    // Format the output string
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
