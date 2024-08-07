import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NextButton extends StatelessWidget {
  NextButton({
    super.key, required this.text, required this.onPressed,

  });
  final String text;
  final VoidCallback onPressed;
 // final GlobalKey<FormState> phoneFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: 114,
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6))),
            backgroundColor:
            const MaterialStatePropertyAll(Color(0xff000000)),
          ),
          onPressed:onPressed,
          child: const Text('Next',
              style: TextStyle(fontSize: 14, color: Colors.white)),
        ),
      ),
    );
  }

  // phoenValidator() {
  //   // print("PhoneeeeeeeeeeeeeeeeeeeeNumber ${phoneNumber}");
  //   // emit(PhoneLoginLoading());
  //   if (!phoneFormKey.currentState!.validate()) {
  //     return;
  //   } else {
  //     phoneFormKey.currentState!.save();
  //   };
  // }
}