import 'package:flutter/material.dart';

class Helpers {
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static String formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  static double calculateSoilQuality({
    required double ph,
    required double moisture,
    required double salinity,
  }) {
    double score = 100;
    
    // خصم نقاط للحموضة غير المناسبة
    if (ph < 6.0 || ph > 7.5) {
      score -= 20;
    }
    
    // خصم نقاط للرطوبة غير المناسبة
    if (moisture < 30 || moisture > 70) {
      score -= 15;
    }
    
    // خصم نقاط للملوحة العالية
    if (salinity > 2.5) {
      score -= 25;
    }
    
    return score.clamp(0, 100);
  }
}
