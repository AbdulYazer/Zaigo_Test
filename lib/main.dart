import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaigo_test/application/images/images_bloc.dart';
import 'package:zaigo_test/presentation/home_screen/home_screen.dart';
import 'package:zaigo_test/presentation/login_screen/login_screen.dart';
import 'package:zaigo_test/presentation/splash_screen/splash_screen.dart';

import 'application/home/home_bloc.dart';
import 'application/login/login_bloc.dart';
import 'domain/core/di/injectable.dart';

void main() async{
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => getIt<HomeBloc>(),
        ),
        BlocProvider(
          create: (context) => ImagesBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Zaigo_Test',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

