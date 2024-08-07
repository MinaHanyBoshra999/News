import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/helper_functions/build_snack_bar.dart';
import 'package:news/core/utlis/app_colors.dart';
import 'package:news/core/utlis/app_text_styles.dart';
import 'package:news/core/widgets/custom_button.dart';
import 'package:news/core/widgets/custom_text_form_field.dart';
import 'package:news/core/widgets/password_field.dart';
import 'package:news/features/Authentication/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:news/features/Authentication/presentation/views/widgets/have_an_account.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {


  String? email;
  String? password;
  String? name;
  String? phoneNumber;
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
              Text('Welcome !',style: AppTextStyles.bold24.copyWith(color: Colors.black),),
              const SizedBox(height: 4,),
              Text('Sign Up to make an account to continue read news',style: AppTextStyles.regular16.copyWith(color:AppColors.lightBlackColor),),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              const Text('Name',style: AppTextStyles.bold14,),
              CustomTextFormField(hintText: 'Name', textInputType: TextInputType.text,onSaved: (value) {
                name=value;

              },),
              const SizedBox(height: 23),
              const Text('Phone Number',style: AppTextStyles.bold14,),
              CustomTextFormField(hintText: 'Phone Number', textInputType: TextInputType.phone,onSaved: (value) {
                                phoneNumber=value;


              },),
              const SizedBox(height: 23),
              const Text('Email',style: AppTextStyles.bold14,),
              CustomTextFormField(hintText: ' Email', textInputType: TextInputType.emailAddress,onSaved: (value) {
                                email=value;

              },),
              const SizedBox(height: 23),
              const Text('Password',style: AppTextStyles.bold14,),
              PasswordField(onSaved: (value) {
                                password=value;

              },),
              const SizedBox(height: 30,),
              CustomButton(text: 'Sign Up', onPressed: (){
               if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    
                    

                          BlocProvider.of<SignUpCubit>(context).signUp(
                            email: email!,
                           name: name!,
                           password: password!,
                           phoneNumber: phoneNumber!,
                          );
                    } else {
                      buildSnackBar(context, message: 'Please fill all fields', backgroundColor: Colors.red);
                    }
             

              }),


              const SizedBox(height: 6,),

              const Align(
                  alignment: Alignment.center,
                  child: HaveAnAccountWidget()),
              const SizedBox(height: 16,)
            ],
          ),
        ),
      ),
    );
  }
}
