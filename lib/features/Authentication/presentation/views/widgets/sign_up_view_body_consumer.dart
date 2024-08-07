import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/helper_functions/build_snack_bar.dart';
import 'package:news/core/widgets/custom_progress_hud.dart';
import 'package:news/features/Authentication/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:news/features/Authentication/presentation/views/sign_in_view.dart';
import 'package:news/features/Authentication/presentation/views/widgets/sign_up_view_body.dart';

import '../../manager/sign_up_cubit/sign_up_states.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          Navigator.pushNamed(context, SignInView.routeName);
        }

        if (state is SignUpFailureState) {
          buildSnackBar(context, message: state.message, backgroundColor: Colors.red);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SignUpLoadingState ? true : false,
          child: const SignUpViewBody(),
        );
      },
    );
  }
  }
