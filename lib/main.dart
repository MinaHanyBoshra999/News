import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/helper_functions/on_generate_route.dart';
import 'package:news/core/services/api_services.dart';
import 'package:news/features/Authentication/presentation/views/sign_in_view.dart';
import 'package:news/features/Home/presentation/manager/news_cubit/news_cubit.dart';
import 'package:news/features/Home/presentation/views/home_view.dart';
import 'package:news/features/PhoneAuth/presentation/view_model/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:news/features/Splash/presentation/views/splash_view.dart';
import 'package:news/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return NewsCubit();
        },),
         BlocProvider(create: (context) {
          return PhoneAuthCubit();
        },)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
      
         fontFamily: 'Poppins',
      
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      
        onGenerateRoute: onGenerateRoute,
        initialRoute: HomeView.routeName,
        // home: const HomeView(),
      ),
    );
  }
}

