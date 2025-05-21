import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orbis/domain/busineslogic/authentication/authcontroller/auth_cubit.dart';
import 'package:orbis/domain/busineslogic/authentication/authway/authway_cubit.dart';
import 'package:orbis/domain/busineslogic/authentication/passworsshow/passwordshow_cubit.dart';
import 'package:orbis/domain/busineslogic/imagrpicker/imagepicker_cubit.dart';
import 'package:orbis/domain/busineslogic/map/map_cubit.dart';
import 'package:orbis/presentation/screens/onbording/pageviewonbording.dart';
import 'package:orbis/utils/constant/Route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await FirebaseAuth.instance.setLanguageCode("en");
  // Ideal time to initialize
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  //...
  await FirebaseAppCheck.instance.setTokenAutoRefreshEnabled(true);
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity,
    appleProvider: AppleProvider.debug,
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => MapCubit()),
        BlocProvider(create: (context) => ImagepickerCubit()),
        BlocProvider(create: (context) => PasswordshowCubit()),
        BlocProvider(create: (context) => AuthwayCubit()),
        // BlocProvider(create: (context) => TicketcontainerCubit()),
        // BlocProvider(create: (context) => DatePickerCubit()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      initialRoute: "/",
      routes: routes,
      debugShowCheckedModeBanner: false,
      home: Scaffold(backgroundColor: Colors.white, body: Pageviewonbording()),
    ) ;
  }
}
