import 'package:flutter/material.dart';
import 'package:news/core/utlis/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onPressed});
  final String text;
 final  void Function()? onPressed;
   
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
    height: 54,
    width: double.infinity,
    child: TextButton(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(color: Colors.white)),
    ),
  );
  }
}
