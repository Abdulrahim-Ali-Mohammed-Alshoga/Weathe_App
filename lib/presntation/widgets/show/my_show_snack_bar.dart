
import 'package:flutter/material.dart';

void MyShowSnackBar(BuildContext context,String message){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message,
        textAlign: TextAlign.center, style: const TextStyle(fontSize: 16.0, fontWeight:
        FontWeight.bold),), duration: const Duration(seconds: 2), backgroundColor: Colors.red,)
  );
}