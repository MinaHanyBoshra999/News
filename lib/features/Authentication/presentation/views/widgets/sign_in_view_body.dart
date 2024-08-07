import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/helper_functions/build_snack_bar.dart';
import 'package:news/core/utlis/app_colors.dart';
import 'package:news/core/utlis/app_text_styles.dart';
import 'package:news/core/widgets/custom_button.dart';
import 'package:news/core/widgets/custom_text_form_field.dart';
import 'package:news/core/widgets/password_field.dart';
import 'package:news/features/Authentication/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:news/features/Authentication/presentation/views/widgets/dont_have_an_account.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  String? email;

  String? password;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                const SizedBox(height: 80,),
                Text('Welcome back!',style: AppTextStyles.bold24.copyWith(color: Colors.black),),
                const SizedBox(height: 4,),
                Text('Login to your account to continue read news',style: AppTextStyles.regular16.copyWith(color:AppColors.lightBlackColor),),

                SizedBox(height: MediaQuery.of(context).size.height * 0.1),

                const Text('Email',style: AppTextStyles.bold14,),
                CustomTextFormField(hintText: 'Enter Your Email', textInputType: TextInputType.emailAddress,onSaved: (value) {
                   email=value;
                },),

                const SizedBox(height: 23),
                const Text('Password',style: AppTextStyles.bold14,),


                PasswordField(onSaved: (value) {
                         password=value;
                },),
                const SizedBox(height: 100,),
                CustomButton(text: 'Login', onPressed: (){

                      if (formKey.currentState!.validate()) {
                           formKey.currentState!.save();
                    

                    BlocProvider.of<SignInCubit>(context).signin(email: email!, password: password!);

                    } else {
                      buildSnackBar(context, message: 'Please fill all fields', backgroundColor: Colors.red);
                    }

                }),


                 const SizedBox(height: 6,),

                 const Align(
                  alignment: Alignment.center,
                  child: DontHaveAnAccountWidget()),
                 const SizedBox(height: 16,)
            ],
          ),
        ),
      ),
    );
  }
}





// Expanded(
//   child: Align(
//     alignment: FractionalOffset.bottomCenter,
//     child: CustomButton(text: 'Login')),
// ),