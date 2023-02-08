import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:logger/logger.dart';
import 'package:owwn_coding_challenge/core/constants/colors.dart';

final logger = Logger();

extension CapExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String get inCaps => '${this[0].toUpperCase()}${substring(1)}';
  String get allInCaps => toUpperCase();
  String get capitalizeFirstofEach =>
      split(" ").map((str) => str.capitalize).join(" ");
}

///
///
/// SizedBox shorthand
Widget sized({double? h, double? w}) => SizedBox(
      height: h ?? 0,
      width: w ?? 0,
    );

///
///
/// const Spacer shorthand
Widget spacer() => const Spacer();

///
///
/// Utility - To set status and navigation bar colors
void setStatusBarColors() {
  FlutterStatusbarcolor.setStatusBarColor(AppColors.black);
  FlutterStatusbarcolor.setNavigationBarColor(
    const Color.fromARGB(255, 0, 0, 0),
  );
  FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
  FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
}

///
///
/// Custom Loader

Widget customLoader = const Center(
  child: CircularProgressIndicator(
    color: AppColors.cwhite,
  ),
);

///
///
/// Flutter toast helper
// Future showToast(String string) {
//   return Fluttertoast.showToast(
//     msg: string,
//     backgroundColor: AppColors.veryDarkBlue,
//     textColor: AppColors.white,
//   );
// }
