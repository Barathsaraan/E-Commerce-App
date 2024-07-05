import 'package:flutter/material.dart';
import 'package:sunstar/constant/font.dart';

Widget buildCategoryButton(String text, Widget? icon, VoidCallback onTap) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          // spreadRadius: 1,
          // blurRadius: 1,
          // offset: const Offset(0, 2),
        ),
      ],
    ),
    child: GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16,
            // vertical: icon != null ? 12 : 16,
            vertical: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              SizedBox(
                width: 20,
                height: 20,
                child: icon,
              ),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: AppFonts.Manrope,
                color: Color.fromRGBO(0, 11, 73, 1),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
