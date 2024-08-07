import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/utlis/app_colors.dart';
import 'package:news/features/Authentication/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:news/features/Authentication/presentation/views/widgets/sign_in_view_body.dart';
import 'package:news/features/Authentication/presentation/views/widgets/sign_in_view_body_consumer.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const String routeName='signin';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: const Scaffold(
        backgroundColor: AppColors.backgroundGrayColor,
        body: SafeArea(child: SigninViewBodyBlocConsumer()),
      ),
    );
  }
}
