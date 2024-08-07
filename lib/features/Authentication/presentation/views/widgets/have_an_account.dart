
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news/core/utlis/app_colors.dart';
import 'package:news/core/utlis/app_text_styles.dart';
import 'package:news/features/Authentication/presentation/views/sign_in_view.dart';
import 'package:news/features/Authentication/presentation/views/sign_up_view.dart';


class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Have an account?',
            style: AppTextStyles.regular16.copyWith(
            ),
          ),
          TextSpan(
            text: ' ',
            style: AppTextStyles.semiBold16.copyWith(
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, SignInView.routeName);
              },
            text:'Login',

            style:
            AppTextStyles.semiBold16.copyWith(color: AppColors.primaryColor,decoration: TextDecoration.underline),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
