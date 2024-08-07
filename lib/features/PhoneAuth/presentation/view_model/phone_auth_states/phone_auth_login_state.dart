abstract class PhoneAuthLoginState{}


class PhoneLoginSuccess extends PhoneAuthLoginState{}
class PhoneLoginFailure extends PhoneAuthLoginState{
  final String? errMessage;

  PhoneLoginFailure({required this.errMessage});
}
class PhoneLoginLoading extends PhoneAuthLoginState{}
class PhoneLoginInitial extends PhoneAuthLoginState{}
class PhoneCodeSentState extends PhoneAuthLoginState{}