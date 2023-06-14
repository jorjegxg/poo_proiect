//display snackbar

import 'package:flutter/material.dart';

void kShowSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor: const Color.fromARGB(221, 68, 68, 68),
        content: Text(message),
      ),
    );
}
