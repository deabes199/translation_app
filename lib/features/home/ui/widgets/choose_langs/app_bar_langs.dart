import 'package:flutter/material.dart';
import 'package:google_translation_app/core/helper/colors.dart';

AppBar appBarLangs() {
  return AppBar(
    backgroundColor: primaryColor,
    title: Text(
      'Select Language',
      style: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}
