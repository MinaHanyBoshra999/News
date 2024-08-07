import 'package:news/features/Authentication/data/models/user_model.dart';

abstract class SignUpStates{}



class SignUpLoadingState extends SignUpStates{}
class SignUpSuccessState extends SignUpStates{
  final UserModel userModel;

  SignUpSuccessState({required this.userModel});
}
class SignUpFailureState extends SignUpStates{
  final String message;

  SignUpFailureState({required this.message});
}
class SignUpInitialState extends SignUpStates{}