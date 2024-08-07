import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/errors/failure.dart';
import 'package:news/features/Authentication/data/repos/auth_repo.dart';
import 'package:news/features/Authentication/presentation/manager/sign_up_cubit/sign_up_states.dart';

class SignUpCubit extends Cubit<SignUpStates>{
  SignUpCubit():super(SignUpInitialState());


   signUp({required String email,required String password, required String name, required String phoneNumber})async{
    emit(SignUpLoadingState());
  var result=await   AuthRepo.createUserWithEmailAndPassword(email: email, password: password, name: name, phoneNumber: phoneNumber);
   result.fold((failure) {
      emit(SignUpFailureState(message: failure.errMessage));
   }, (userModel) {
      emit(SignUpSuccessState(userModel: userModel));
   },);


   }








}