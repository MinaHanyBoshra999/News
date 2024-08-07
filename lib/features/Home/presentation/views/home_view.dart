import 'package:flutter/material.dart';
import 'package:news/core/utlis/app_colors.dart';
import 'package:news/features/Home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = "HomeView";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundGrayColor,
      body: SafeArea(child: HomeViewBody()),
    );
  }
}