import 'package:assignment/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MyAppBar extends AppBar{
  final String titleText;
  MyAppBar({super.key, required this.titleText, }):super (
    title: Text(titleText,
    style: GoogleFonts.poppins(
        fontSize: 24,
        color: AppColors.primaryBlue,
       fontWeight: FontWeight.w600
    ),
    ),
  );
}