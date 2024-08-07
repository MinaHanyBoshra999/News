
import 'package:flutter/material.dart';
import 'package:news/features/Authentication/presentation/views/sign_in_view.dart';
import 'package:news/features/Authentication/presentation/views/sign_up_view.dart';
import 'package:news/features/Home/presentation/views/home_view.dart';
import 'package:news/features/Home/presentation/views/news_details_view.dart';
import 'package:news/features/PhoneAuth/presentation/view/otp_view.dart';
import 'package:news/features/Splash/presentation/views/splash_view.dart';

Route<dynamic>onGenerateRoute(RouteSettings settings){

  switch(settings.name){

    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView(),);
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView(),);
    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => const SignInView(),);
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView(),);
     case OtpView.routeName:
      return MaterialPageRoute(builder: (context) => const OtpView(),); 
      
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());

  }

}