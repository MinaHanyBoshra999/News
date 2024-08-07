import 'package:dartz/dartz.dart';
import 'package:news/features/Authentication/data/models/user_model.dart';

abstract class SignInStates{}



class SignInLoadingState extends SignInStates{}
class SignInSuccessState extends SignInStates{
  final UserModel userModel;

  SignInSuccessState({required this.userModel});
}
class SignInFailureState extends SignInStates{
    final String message;

  SignInFailureState({required this.message});

}
class SignInInitialState extends SignInStates{}