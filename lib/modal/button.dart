import 'package:flutter/material.dart';

final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
  minimumSize: const Size(235, 50), backgroundColor: Colors.teal,
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(50),
    ),
  ),
);