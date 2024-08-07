import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/utlis/app_colors.dart';
import 'package:news/features/Authentication/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:news/features/Authentication/presentation/views/widgets/sign_up_view_body.dart';
import 'package:news/features/Authentication/presentation/views/widgets/sign_up_view_body_consumer.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName='signUp';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: const Scaffold(
        backgroundColor: AppColors.backgroundGrayColor,
        body: SafeArea(child: SignUpViewBodyBlocConsumer()),
      ),
    );
  }
}
