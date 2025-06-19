import 'package:flutter/material.dart';

extension ExtensionDateTime on DateTime {
  DateTime get endOfDay {
    if (isUtc) {
      return DateTime.utc(year, month, day, 23, 59, 59, 999, 999);
    }

    return DateTime(year, month, day, 23, 59, 59, 999, 999);
  }

  DateTime get endOfMonth {
    if (isUtc) {
      return DateTime.utc(year, month, DateUtils.getDaysInMonth(year, month));
    }

    return DateTime(year, month, DateUtils.getDaysInMonth(year, month));
  }

  DateTime get endOfWeek {
    if (isUtc) {
      return DateTime.utc(year, month, day + (7 - weekday));
    }

    return DateTime(year, month, day + (7 - weekday));
  }

  DateTime get startOfDay {
    if (isUtc) {
      return DateTime.utc(year, month, day);
    }

    return DateTime(year, month, day);
  }

  DateTime get startOfMonth {
    if (isUtc) {
      return DateTime.utc(year, month, 1);
    }

    return DateTime(year, month, 1);
  }

  DateTime get startOfWeek {
    if (isUtc) {
      return DateTime.utc(year, month, day - (weekday - 1));
    }

    return DateTime(year, month, day - (weekday - 1));
  }

  bool isSameDay(DateTime other) {
    return day == other.day && month == other.month && year == other.year;
  }

  bool isSameMonth(DateTime other) {
    return month == other.month && year == other.year;
  }

  bool isSameWeek(DateTime other) {
    return startOfWeek == other.startOfWeek;
  }

  bool isSameYear(DateTime other) {
    return year == other.year;
  }
}
