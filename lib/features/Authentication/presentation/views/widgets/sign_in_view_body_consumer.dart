import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/helper_functions/build_snack_bar.dart';
import 'package:news/core/widgets/custom_progress_hud.dart';
import 'package:news/features/Authentication/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:news/features/Authentication/presentation/manager/sign_in_cubit/sign_in_states.dart';
import 'package:news/features/Authentication/presentation/views/sign_up_view.dart';
import 'package:news/features/Authentication/presentation/views/widgets/sign_in_view_body.dart';
import 'package:news/features/Home/presentation/views/home_view.dart';
import 'package:news/features/PhoneAuth/presentation/view/otp_view.dart';
import 'package:news/features/PhoneAuth/presentation/view_model/phone_auth_cubit/phone_auth_cubit.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInStates>(
      listener: (context, state) {
        if (state is SignInSuccessState) {
          BlocProvider.of<PhoneAuthCubit>(context).sendOTPCode(phoneNumber: state.userModel.phoneNumber);
          Navigator.pushNamed(context, OtpView.routeName);
          
        }

        if (state is SignInFailureState) {
          buildSnackBar(context, message: state.message, backgroundColor: Colors.red);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SignInLoadingState ? true : false,
          child: const SignInViewBody(),
        );
      },
    );
  }
  }
