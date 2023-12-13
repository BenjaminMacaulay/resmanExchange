import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String shortenText(
  String stringToConvert,
  int lenght,
) {
  if (stringToConvert.length <= lenght) {
    return stringToConvert;
  } else {
    return stringToConvert.substring(0, lenght) + '...';
  }
}

bool filterDocumentsBycurrentMonth(DateTime dateTime) {
  // check a date time variable and check if it matches a datetime thats within the current month
  DateTime now = DateTime.now();
  return dateTime.month == now.month && dateTime.year == now.year;
}

bool filterDocumentsbyCurrentweek(DateTime dateTimeToCheck) {
  DateTime now = DateTime.now();

  // Calculate the start and end of the current week.
  DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
  DateTime endOfWeek = now.add(Duration(days: 7 - now.weekday));

  // Check if the given dateTimeToCheck falls within the current week.
  return dateTimeToCheck.isAfter(startOfWeek) &&
      dateTimeToCheck.isBefore(endOfWeek);
}

bool filterDocumentsbylastmonth(DateTime dateTime) {
// Get the current date and time
  DateTime now = DateTime.now();

  // Get the first day of the current month
  DateTime firstDayOfCurrentMonth = DateTime(now.year, now.month, 1);

  // Calculate the first day of the previous month by subtracting one month from the current date
  DateTime firstDayOfPreviousMonth = DateTime(now.year, now.month - 1, 1);

  // Check if the given dateTime is after or equal to the first day of the previous month
  // and before the first day of the current month
  return dateTime.isAfter(firstDayOfPreviousMonth) &&
      dateTime.isBefore(firstDayOfCurrentMonth);
}

bool filterDocumentsbylastweek(DateTime inputDateTime) {
  DateTime now = DateTime.now();
  DateTime previousWeekStart = now.subtract(Duration(days: now.weekday + 7));
  DateTime previousWeekEnd = now.subtract(Duration(days: now.weekday));

  return inputDateTime.isAfter(previousWeekStart) &&
      inputDateTime.isBefore(previousWeekEnd);
}

bool checkDifferentDayOveride(DateTime dateTime) {
  DateTime now = DateTime.now();
  return now.year != dateTime.year ||
      now.month != dateTime.month ||
      now.day != dateTime.day;
}

String combinePinText(
  String valueone,
  String valuetwo,
  String valuethree,
  String valuefour,
  String valuefive,
) {
  // combine string values together to make one string
  return valueone + valuetwo + valuethree + valuefour + valuefive;
}

DateTime generateTimeTwoMinuitesAgoOTP() {
  // check current time and output the time it was two minutes ago
  final now = DateTime.now();
  final twoMinutesAgo = now.subtract(Duration(minutes: 2));
  print('Current Time: $now');
  print('Time Two Minutes Ago: $twoMinutesAgo');
  return twoMinutesAgo;
}

int? countNumberOfStrings(String stringToCount) {
  // count characters in a string and dont account for empty space
  int count = 0;
  for (int i = 0; i < stringToCount.length; i++) {
    if (stringToCount[i] != ' ') {
      count++;
    }
  }
  return count;
}

bool checkDatetimeWithinTwoWeeks(DateTime dateTime) {
  // scheck if dateTime is within two weeks
  DateTime now = DateTime.now();
  DateTime twoWeeksAgo = now.subtract(Duration(days: 14));
  DateTime twoWeeksFromNow = now.add(Duration(days: 14));

  return dateTime.isAfter(twoWeeksAgo) && dateTime.isBefore(twoWeeksFromNow);
}

DateTime dateTimeTwoWeeksAgo() {
  // output the datetime two weeks ago from the current time
  final now = DateTime.now();
  final twoWeeksAgo = now.subtract(Duration(days: 14));
  return twoWeeksAgo;
}

int randomFiveDigitCode() {
  // Generate random five digit integer code
  var rng = math.Random();
  return rng.nextInt(90000) + 10000;
}

double customRoundupValue(
  double inputDouble,
  int? numberExpected,
) {
  if (numberExpected == null) {
    // If numberExpected is not provided, round to the nearest whole number
    return inputDouble.roundToDouble();
  } else if (numberExpected >= 0) {
    // Round to the specified number of decimal places
    double multiplier = 10.0;
    for (int i = 0; i < numberExpected; i++) {
      multiplier *= 10.0;
    }
    return (inputDouble * multiplier).round() / multiplier;
  } else {
    // Handle invalid numberExpected
    throw ArgumentError("numberExpected must be a non-negative integer.");
  }
}

double ratePerDollar(
  double localRate,
  double dollarRatePerLocalCurrency,
) {
  // divide the fields and round the return value to two decimal places
  double ratePerDollar = localRate / dollarRatePerLocalCurrency;
  return double.parse((ratePerDollar).toStringAsFixed(2));
}

double divideToGetCryptoValue(
  double dollarValue,
  double cryptoRate,
) {
  // divide the dollar value by the cryptoRate and round the decimals to 8
  double cryptoValue = dollarValue / cryptoRate;
  return double.parse(cryptoValue.toStringAsFixed(8));
}

DateTime futureMINUTESGenerated(int minutes) {
  // generate a datetime in the future based on the amount of minutes inputed
  final now = DateTime.now();
  final futureTime = now.add(Duration(minutes: minutes));
  return futureTime;
}

int hours(int remainingMilliseconds) {
  int remainingSeconds = remainingMilliseconds ~/ 1000;
  int hours = remainingSeconds ~/ 3600;
  return hours;
}

int minuites(int remainingMilliseconds) {
  int remainingSeconds = remainingMilliseconds ~/ 1000;
  int minutes = (remainingSeconds % 3600) ~/ 60;
  return minutes;
}

int seconds(int remainingMilliseconds) {
  int remainingSeconds = remainingMilliseconds ~/ 1000;
  int seconds = remainingSeconds % 60;
  return seconds;
}

int checkStringLenght(String? stringLenght) {
  // check lenght of string characters
  if (stringLenght == null) {
    return 0;
  } else {
    return stringLenght.length;
  }
}

int converttomiliseconds(DateTime futureDateTime) {
  DateTime currentDateTime = DateTime.now();
  Duration remainingDuration = futureDateTime.difference(currentDateTime);

  // Check if the futureDateTime is in the past
  if (remainingDuration.isNegative) {
    return 0;
  }

  int remainingMilliseconds = remainingDuration.inMilliseconds;
  return remainingMilliseconds;
}

String removeUserTransactionsREF(String inputString) {
// Define the string to be removed
  String searchString = "/User_Transactions/";

  // Use the replaceAll method to remove the string
  String result = inputString.replaceAll(searchString, '');

  return result;
}

String isActiveWithin5Minutes(DateTime dateTime) {
  DateTime now = DateTime.now();
  Duration difference = now.difference(dateTime);

  if (difference.inMinutes.abs() <= 5) {
    return "Active";
  } else {
    return "Inactive";
  }
}

bool timeWithin5minuites(DateTime? dateTime) {
  // check if datetime value is within 5 minuites of current time and if null return false
  if (dateTime == null) {
    return false;
  }
  final now = DateTime.now();
  final difference = now.difference(dateTime).inMinutes.abs();
  return difference <= 5;
}

DateTime timeStamp24HoursAgo() {
  // generate a datetime from 24hours ago from current time
  final now = DateTime.now();
  final twentyFourHoursAgo = now.subtract(Duration(hours: 24));
  return twentyFourHoursAgo;
}

bool fuzzySearchFunction(
  String stringToSearch,
  String stringToMatch,
) {
  if (stringToMatch == null || stringToSearch == null) {
    return false;
  }

  final searchWords = stringToSearch.toLowerCase().split(' ');
  final matchWords = stringToMatch.toLowerCase().split(' ');

  for (final searchWord in searchWords) {
    for (final matchWord in matchWords) {
      if (matchWord.contains(searchWord) || searchWord.contains(matchWord)) {
        return true;
      }
    }
  }

  return false;
}

int stringtointeger(String stringValue) {
  // string to integer convert
  return int.parse(stringValue);
}

bool diffBetweeenTimeAndCurrentTime24(DateTime dateTime) {
  // is current time greater than datetime by 24hours
  DateTime currentTime = DateTime.now();
  Duration difference = currentTime.difference(dateTime);
  if (difference.inHours >= 24) {
    return true;
  } else {
    return false;
  }
}

double divideFigures(
  double figureOne,
  double figureTwo,
) {
  // divide two values
  return figureOne / figureTwo;
}

String smallLetterChange(String string) {
  // change all characters to small letters and remove spaces
  return string.toLowerCase().replaceAll(' ', '');
}

String formatNumberWithCommas(String input) {
  if (input.isEmpty) {
    return input;
  }

  double number = double.parse(input);
  String formatted = number.toStringAsFixed(2);

  List<String> parts = formatted.split('.');
  String integerPart = parts[0];
  String decimalPart = parts.length > 1 ? parts[1] : '00';

  int length = integerPart.length;
  String formattedInteger = '';
  int commaIndex = 0;

  for (int i = length - 1; i >= 0; i--) {
    if (commaIndex == 3) {
      formattedInteger = ',' + formattedInteger;
      commaIndex = 0;
    }
    formattedInteger = integerPart[i] + formattedInteger;
    commaIndex++;
  }

  return formattedInteger + '.' + decimalPart;
}

double stringToDouble(String input) {
  double result;

  try {
    String sanitizedInput = input.replaceAll(',', ''); // Remove commas
    result = double.tryParse(sanitizedInput) ??
        0.0; // Default value if parsing fails
  } catch (e) {
    result = 0.0; // Handle exceptions if needed
  }

  return result;
}

DateTime generateTimeStampThreeMonthsAgo() {
  // Generate timestamp three months ago from current time
  final now = DateTime.now();
  final threeMonthsAgo = DateTime(
      now.year, now.month - 3, now.day, now.hour, now.minute, now.second);
  return threeMonthsAgo;
}
