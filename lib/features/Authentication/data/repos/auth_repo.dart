import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:news/core/errors/exceptions.dart';
import 'package:news/core/errors/failure.dart';
import 'package:news/core/services/firebase_auth_service.dart';
import 'package:news/core/services/firestore_service.dart';
import 'package:news/features/Authentication/data/models/user_model.dart';

class AuthRepo {
 static Future<Either<Failure, UserModel>> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name,
      required String phoneNumber}) async {
    try {
      var user = await FirebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      UserModel userModel = UserModel(
          name: name, email: email, uId: user.uid, phoneNumber: phoneNumber);
      await addUserDate(userModel: userModel);
      return right(userModel);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'SomeThing went wrong , please try again',
        ),
      );
    }
  }

  static Future<Either<Failure, UserModel>> signinWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var user = await FirebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      UserModel userModel = await getUserData(uid: user.uid);
      print('------------------------------------------------------------------------');
      print('Name ${userModel.name}');
      print('phone ${userModel.phoneNumber}');
      print('------------------------------------------------------------------------');

      return right(
        userModel,
      );
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.SigninWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'SomeThing went wrong , please try again',
        ),
      );
    }
  }

 static addUserDate({required UserModel userModel}) async {
    await FireStoreService.addData(path: 'users', data: userModel.toMap(),docuementId: userModel.uId);
  }

  static getUserData({required String uid}) async {
    var userData =
        await FireStoreService.getData(path: 'users', docuementId: uid);

    return UserModel.fromJson(userData);
  }
}
