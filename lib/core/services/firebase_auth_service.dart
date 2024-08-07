import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:news/core/errors/exceptions.dart';

class FirebaseAuthService{

  static Future<User> createUserWithEmailAndPassword({required String email, required String password})async{
    try{
     UserCredential credential= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        return credential.user!;
    }on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      if (e.code == 'weak-password') {
        throw CustomException(message: 'weak-password');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'email-already-in-use');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'network-request-failed');
      } else {
        throw CustomException(
            message: 'Something went wrong ,Please try again');
      }
    } catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}");

      throw CustomException(
          message: 'Something went wrong ,Please try again');
    }
  }



 static Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      if (e.code == 'user-not-found') {
        throw CustomException(
            message: 'user-not-found.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: '.wrong-password');
      } else if (e.code == 'invalid-credential') {
        throw CustomException(
            message: 'invalid-credential.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'network-request-failed');
      } else {
        throw CustomException(
            message: 'Something went wrong ,Please try again');
      }
    } catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}");

      throw CustomException(
          message: 'Something went wrong ,Please try again.');
    }
  }



  }













