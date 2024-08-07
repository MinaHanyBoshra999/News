import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/PhoneAuth/presentation/view_model/phone_auth_states/phone_auth_login_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthLoginState>{
  PhoneAuthCubit():super (PhoneLoginInitial());

  // String phoneNumber='';
  String smsCode='';
  String verificationId='';
   sendOTPCode({required String phoneNumber})async{
  try{
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: (String verificationId) {},
    );


  }catch(e){
    print('//////////////////// Catch Exeption ///////////////////');
    emit(PhoneLoginFailure(errMessage: e.toString()));
  }

  



}



  void verificationFailed(FirebaseAuthException e){
     emit(PhoneLoginFailure(errMessage: e.toString()));
     print('verificationFailed : ${e.toString()}');


  }
  void codeSent(String? verificationId, int? resendToken){
    print('//////////////////// Emit Succes ///////////////////');
    emit(PhoneCodeSentState());

     
  

  }
  
  



}