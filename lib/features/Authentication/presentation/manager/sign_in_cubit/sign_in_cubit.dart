import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/Authentication/data/repos/auth_repo.dart';
import 'package:news/features/Authentication/presentation/manager/sign_in_cubit/sign_in_states.dart';

class SignInCubit extends Cubit<SignInStates>{
  SignInCubit() : super(SignInInitialState());


Future<void> signin({required String email,required String password}) async {
    emit(SignInLoadingState());
    var result = await AuthRepo.signinWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(SignInFailureState(message: failure.errMessage)),
      (userModel) => emit(SignInSuccessState(userModel: userModel)),
    );
  }




}