import 'package:flutter/material.dart';

class IntroText extends StatelessWidget {
  const IntroText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 44,),
        Text('What is your phone number?',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
         SizedBox(height: 24,),
        Text('Please enter your phone number to verify your account.',style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal)),
      ],
    );
  }
}