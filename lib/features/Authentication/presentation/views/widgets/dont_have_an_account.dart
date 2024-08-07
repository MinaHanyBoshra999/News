
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news/core/utlis/app_colors.dart';
import 'package:news/core/utlis/app_text_styles.dart';
import 'package:news/features/Authentication/presentation/views/sign_up_view.dart';


class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account?',
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
                Navigator.pushNamed(context, SignUpView.routeName);
              },
            text:'Sign Up',

            style:
                AppTextStyles.semiBold16.copyWith(color: AppColors.primaryColor,decoration: TextDecoration.underline),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
