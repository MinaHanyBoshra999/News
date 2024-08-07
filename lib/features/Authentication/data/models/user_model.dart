import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String name;
  final String email;
  final String uId;
  final String phoneNumber;

  UserModel({required this.name, required this.email, required this.uId,required this.phoneNumber, });


  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uId: user.uid,
      phoneNumber: user.phoneNumber ??'',
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      uId: json['uId'],
      phoneNumber: json['phoneNumber']
    );
  }

  toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      'phoneNumber':phoneNumber
    };
  }
}
