import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:date_format/date_format.dart';

var logger = Logger();

Size boundingTextSize(String text, TextStyle style, {int maxLines = 2 ^ 31, double maxWidth = double.infinity}) {
  if (text.isEmpty) {
    return Size.zero;
  }
  final TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr, text: TextSpan(text: text, style: style), maxLines: maxLines)..layout(maxWidth: maxWidth);
  return textPainter.size;
}

String getDateFormatString(String epoch) {

  String time = formatDate(DateTime.fromMicrosecondsSinceEpoch(int.parse(epoch)), [yy, '-', M, '-', d]);
  Logger().d(time);
  return formatDate(DateTime.fromMicrosecondsSinceEpoch(int.parse(epoch)), [yy, '-', M, '-', d]);

}