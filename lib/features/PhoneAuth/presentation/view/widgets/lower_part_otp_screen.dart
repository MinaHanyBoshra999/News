import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpLowerPart extends StatelessWidget {
  const OtpLowerPart({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const Text('Didn’t recieve a verification code?',style: TextStyle(fontSize: 12)),
        const SizedBox(height: 12,),
         Row(

         mainAxisAlignment: MainAxisAlignment.center,
           children: [
             OtpTextButton(text: 'Resend code',onPressed: (){
              //  BlocProvider.of<PhoneAuthCubit>(context).sendOTPCode();

             }),
             const SizedBox(
               height: 20,
               child:  Padding(
                 padding: EdgeInsets.symmetric(horizontal: 8.0,),
                 child: VerticalDivider(


                     endIndent: 1,
                     indent: 1,
                     color: Colors.black,
                     thickness: 1),
               ),
             ),
            OtpTextButton(text: 'Change number', onPressed: () {
            },),
           ],),
      ],
    );
  }
}

class OtpTextButton extends StatelessWidget {
  const OtpTextButton({
    super.key, required this.text, required this.onPressed,
  });
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Text(text,style: const TextStyle(fontSize: 12,color: Colors.blue)),
        onPressed: onPressed,

    );
  }
}
