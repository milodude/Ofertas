import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ofertas/features/login/presentation/pages/login_page.dart';
import 'package:ofertas/features/login/presentation/pages/landing_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //TODO: Reemplazar change notifier por un bloc
  // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   return ChangeNotifierProvider(
  //     create: (context)=>UserRepositoryImpl(),
  //     child: MaterialApp(
  //       title: 'Ofertas Demo',
  //       theme: ThemeData(
  //         primarySwatch: Colors.red,
  //       ),
  //       home: Scaffold(
  //         body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, snapshot){
  //           if(snapshot.hasData){
  //             return const LandingPage();
  //           }else{
  //             return const LoginPage();
  //           }
  //         }),
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ofertas Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, snapshot){
          if(snapshot.hasData){
            return const LandingPage();
          }else{
            return const LoginPage();
          }
        }),
      ),
    );
  }
}
