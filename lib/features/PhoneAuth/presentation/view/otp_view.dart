import 'package:flutter/material.dart';
import 'package:news/core/utlis/app_colors.dart';


import 'otp_View_Body.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});
   static const String routeName = 'OtpView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundGrayColor,
      body: OtpViewBody(),
    );
  }
}
