import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class Formatter {
  static String fotmatStr = '###,##0.';

  // Uygulama içerisindeki para değerlerini formatlamak için kodlanmış fonksiyon
  static String formatMoney(dynamic value, {int? zeroCount, int? afterZeroCount}) {
    if (value == null) return '-';
    String? str;
    NumberFormat customFormat;
    var customfotmatStr = fotmatStr;
    if (zeroCount == null && afterZeroCount == null) {
      customFormat = _createFormat(value) ?? NumberFormat(customfotmatStr += '00##', 'tr_TR');
    } else {
      for (var i = 0; i < zeroCount!; i++) {
        customfotmatStr += '0';
      }
      for (var i = 0; i < afterZeroCount!; i++) {
        customfotmatStr += '#';
      }
      customFormat = NumberFormat(customfotmatStr, 'tr_TR');
    }

    try {
      if (value is double) {
        str = customFormat.format(value);
      } else if (value is String) {
        var number = double.tryParse(value) ?? double.tryParse(value.replaceFirst(',', '.'));
        if (number == null) return '-';
        str = customFormat.format(number);
      } else {
        str = '-';
      }
    } catch (e) {
      Get.find<Logger>().e(e);
      str = '-';
    }
    return '$str ₺';
  }

  static NumberFormat? _createFormat(dynamic value) {
    try {
      List<String> digits;
      var format = fotmatStr;
      var count = 1;
      if (value is double) {
        digits = value.toString().split('.');
      } else if (value is String) {
        var number = double.tryParse(value) ?? double.tryParse(value.replaceFirst(',', '.'));
        if (number == null) return null;
        digits = number.toString().split('.');
      } else {
        return null;
      }
      if (digits.isNotEmpty) {
        if (digits[0].length > 2) {
          format += '00';
        } else {
          for (var i = 0; i < digits[1].length; i++) {
            if (int.parse(digits[1][i].toString()) != 0) {
              count = i + 1;
            }
          }
          for (var i = 0; i < count; i++) {
            format += '0';
          }
        }
        return NumberFormat(format, 'tr_TR');
      }
    } catch (e) {
      Get.find<Logger>().e(e);
    }
    return null;
  }

  static dynamic apiDecode(dynamic data) {
    if (data is String) {
      try {
        return jsonDecode(data);
      } catch (e) {
        return null;
      }
    } else if (data is Map || data is List) {
      return data;
    } else {
      return null;
    }
  }

  static final DateFormat _formatter = DateFormat('dd/MM/yyyy');

  static String processDate(dynamic dateInput) {
    DateTime date;

    if (dateInput is String) {
      final isUtc = dateInput.contains('T') && dateInput.contains('Z');
      date = isUtc ? DateTime.parse(dateInput).toLocal() : _formatter.parse(dateInput).toLocal();
    } else if (dateInput is DateTime) {
      date = dateInput.toLocal();
    } else {
      throw ArgumentError('Invalid date input: $dateInput');
    }

    return _formatter.format(date);
  }

  static String? convertToUtcString(String dateInput) {
    if (!RegExp(r'\d').hasMatch(dateInput)) {
      return null;
    }

    try {
      DateTime date = _formatter.parse(dateInput);
      DateTime utcDate = date.toUtc();
      String formattedDate = utcDate.toString();
      return formattedDate;
    } catch (e) {
      return null;
    }
  }

  static DateTime? stringToDateTime(String? timeString) {
    if (timeString != null) {
      List<String> parts = timeString.split(':');
      if (parts.length == 2) {
        int? hour = int.tryParse(parts[0]);
        int? minute = int.tryParse(parts[1]);
        if (hour != null && minute != null) {
          return DateTime(1, 1, 1, hour, minute);
        }
      }
    }
    return null;
  }

  static int calculateMonthDifference(DateTime? startDate, DateTime? endDate) {
    if (startDate == null || endDate == null) {
      return 0;
    }

    int startYear = startDate.year;
    int startMonth = startDate.month;
    int endYear = endDate.year;
    int endMonth = endDate.month;

    int yearDifference = endYear - startYear;
    int monthDifference = endMonth - startMonth;

    return yearDifference * 12 + monthDifference;
  }

  static var creditCardExpirationDateInputFormatters = [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(4),
    ExpirationDateInputFormatter(),
  ];

  static var creditCardNumberInputFormatters = [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(19),
    CreditCardNumberFormatter(),
  ];

  static List<int>? getExprationDateInputs(String dateInput) {
    final parts = dateInput.split('/');
    if (parts.length == 2) {
      final month = int.tryParse(parts[0]);
      final year = int.tryParse(parts[1]);
      if (month != null && year != null) {
        return [month, year];
      }
    }
    return null;
  }

  static List<TextInputFormatter> onlyLettersInputFormatter = [OnlyLettersInputFormatter()];
}

class OnlyLettersInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final RegExp regex = RegExp(r'^[a-zA-Z\s]*$');
    if (regex.hasMatch(newValue.text)) {
      return newValue;
    } else {
      return oldValue;
    }
  }
}

class ExpirationDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text;

    if (newText.length >= 3) {
      newText = newText.replaceRange(2, 2, '/');
    }

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class CreditCardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newText = _addSpaces(newValue.text);

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }

  String _addSpaces(String text) {
    final buffer = StringBuffer();
    final cleanedText = text.replaceAll(' ', '');

    for (int i = 0; i < cleanedText.length; i++) {
      if (i % 4 == 0 && i != 0) {
        buffer.write(' ');
      }
      buffer.write(cleanedText[i]);
    }

    return buffer.toString();
  }
}
