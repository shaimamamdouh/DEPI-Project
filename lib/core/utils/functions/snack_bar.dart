import 'package:flutter/material.dart';
import 'package:readio/main.dart';


void showSnackBar(String message) {
  rootScaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(content: Text(message)),
  );

  
}
