import 'package:flutter/material.dart';

void buildSnackBar(BuildContext context, {required String message, required Color backgroundColor}) {
  ScaffoldMessenger.of(context).showSnackBar(
    
    SnackBar(
     backgroundColor: backgroundColor,
      content: Text(message,style: const TextStyle(color: Colors.white),),
    ),
  );
}