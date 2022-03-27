import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_s/provider/chat_provider.dart';
import 'package:provider_s/provider/login_provider.dart';
import 'package:provider_s/provider/singup_provider.dart';
import 'package:provider_s/ui/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChatProvider()),
        ChangeNotifierProvider(create: (context) => SigninProvaider()),
        ChangeNotifierProvider(
          create: (context) => LoginProvaider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          //scaffoldBackgroundColor: Colors.lightBlue[100],
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontFamily: 'SansitaSwashed', fontWeight: FontWeight.w100),
            headline2: TextStyle(
                fontFamily: 'DancingScript',
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),

          primarySwatch: Colors.blue,
        ),
        home: const SplashScrren(),
      ),
    );
  }
}
