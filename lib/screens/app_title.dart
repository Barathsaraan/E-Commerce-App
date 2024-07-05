import 'package:flutter/material.dart';
import 'package:sunstar/constant/color.dart';

import 'package:sunstar/constant/font.dart';

class AppTitle extends StatelessWidget {
  final String firstName;
  final String secondName;
  final Color firstColor;
  final Color secondColor;
  final double fontSize;

  const AppTitle({
    super.key,
    required this.firstName,
    required this.secondName,
    this.firstColor = Colors.black,
    this.secondColor = AppColors.commonColor,
    this.fontSize = 30,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$firstName ',
            style: TextStyle(
                color: firstColor,
                fontSize: fontSize,
                fontFamily: AppFonts.gilroy,
                fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: secondName,
            style: TextStyle(
                color: secondColor,
                fontSize: fontSize,
                fontFamily: AppFonts.gilroy,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
