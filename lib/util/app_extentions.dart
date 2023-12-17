import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../domain/entities/variant.dart';

extension FormatDate on DateTime{

  toDateTime(){
    return DateFormat('dd-MM-yyyy hh:mm a').format(this);
  }
  toTime(){
    return DateFormat('hh:mm a').format(this);
  }
  toDate(){
    return DateFormat('dd-MM-yyyy').format(this);
  }
  toDayNameAndDate(){
    final formatter = DateFormat('EEEE, dd MMM yyyy');
    final formattedDate = formatter.format(this);
    return formattedDate;
  }
  toDayMonthNameAndYear(){
    final formatter = DateFormat('dd MMM yyyy');
    final formattedDate = formatter.format(this);
    return formattedDate;
  }
  bool isToday(){

   return DateTime.now().toDate()==toDate();
  }

}


extension GlobalKeyExtension on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      final offset = Offset(translation.x, translation.y);
      return renderObject!.paintBounds.shift(offset);
    } else {
      return null;
    }
  }
}



extension FormatStringToDate on String{

  formatToDateTime(){
    return DateFormat('yyyy MM-dd').parse(this);
  }

  String toCamelCase(){
    if(this=="Other"){
      return "otherText";
    }
    List<String> words = toLowerCase().split(" ");
    String camelCase=words[0] + words.sublist(1).map((word) => word[0].toUpperCase() + word.substring(1)).join("").trim();
    return camelCase;
  }
}



extension TimeAgo on String {
  String timeAgo() {
    DateTime now = DateTime.now();
    DateTime time = DateTime.parse(this);

    Duration difference = now.difference(time);

    if (difference.inDays >= 365) {
      int years = difference.inDays ~/ 365;
      return '$years year${years > 1 ? 's' : ''} ago';
    } else if (difference.inDays >= 30) {
      int months = difference.inDays ~/ 30;
      return '$months month${months > 1 ? 's' : ''} ago';
    } else if (difference.inDays >= 7) {
      int weeks = difference.inDays ~/ 7;
      return '$weeks week${weeks > 1 ? 's' : ''} ago';
    } else if (difference.inDays >= 1) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }
}


extension VariantListExtension on List<Variant> {
  String? getUrlBySize({int? width, int? height}) {
    width=width??674;
    height=height??446;
    Variant? foundVariant;
    double closestDiff = double.infinity;

    for (final variant in this) {
      if (variant.width == width && variant.height == height) {
        return variant.url;
      }

      final widthDiff = (variant.width!.toDouble() - width.toDouble()).abs();
      final heightDiff = (variant.height!.toDouble() - height.toDouble()).abs();
      final totalDiff = widthDiff + heightDiff;

      if (totalDiff < closestDiff) {
        foundVariant = variant;
        closestDiff = totalDiff;
      }
    }

    return foundVariant?.url;
  }
}



