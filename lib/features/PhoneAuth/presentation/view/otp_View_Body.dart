import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/helper_functions/build_snack_bar.dart';

import 'package:news/core/widgets/custom_button.dart';
import 'package:news/features/Home/presentation/views/home_view.dart';
import 'package:news/features/PhoneAuth/presentation/view/widgets/lower_part_otp_screen.dart';
import 'package:news/features/PhoneAuth/presentation/view_model/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:news/features/PhoneAuth/presentation/view_model/phone_auth_states/phone_auth_login_state.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class OtpViewBody extends StatefulWidget {
  const OtpViewBody({super.key});

  @override
  State<OtpViewBody> createState() => _OtpViewBodyState();
}

class _OtpViewBodyState extends State<OtpViewBody> {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
String? smsCode;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: BlocConsumer<PhoneAuthCubit,PhoneAuthLoginState>(
            
              builder: (context, state) {
                if(state is PhoneLoginLoading){
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Center(child: CircularProgressIndicator(),),
                    ],
                  );
                }
               
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const OtpUpperPart(),
                    const SizedBox(
                      height: 75,
                    ),
                    
                    PinCodeTextField(
                      
                      appContext: context,
                      length: 6,
                      animationDuration: const Duration(milliseconds: 300),
                      animationType: AnimationType.fade,
                      keyboardType: TextInputType.phone,
                      pinTheme: PinTheme(
                        borderRadius: BorderRadius.circular(6),
                        shape:PinCodeFieldShape.box,
                        inactiveColor: Colors.black,
                        fieldHeight: 50,
                        fieldWidth: 40,
                        borderWidth: 1,
          
    
            
            
                      ),
                      onSaved: (value) {
                        smsCode = value;  
                      },
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                   
                    const SizedBox(
                      height: 80,
                    ),            
            
                  ],
                );
              },
              listener: (context, state) {
                   if(state is PhoneLoginFailure){
                  return buildSnackBar(context, message: state.errMessage.toString(), backgroundColor: Colors.red,);  
                }
            
                if(state is PhoneCodeSentState){
                  Navigator.pushReplacementNamed(context, HomeView.routeName);
                }
              },
            
            ),
          ),
        ),
      ),
    );
  }
}

class OtpUpperPart extends StatelessWidget {
  const OtpUpperPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 88,
        ),
        const Text('Verify your phone number',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 24,
        ),
        Text.rich(
          TextSpan(
              style: TextStyle(fontSize: 16),
              text: 'Enter your 6 digit code numbers sent to you at ',
              children: [
                TextSpan(
                    text: '+20123456789',
                    style: TextStyle(color: Colors.blue))
              ]),
        ),
      ],
    );
  }
}
