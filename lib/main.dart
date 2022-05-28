import 'package:fitness_gym/screens/login/login_view_model.dart';
import 'package:fitness_gym/screens/register/register_view_model.dart';
import 'package:fitness_gym/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RegisterViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const WelcomeScreen(),
        theme: ThemeData(
            fontFamily: 'Poppins', backgroundColor: const Color(0xFFFEFEFE)),
      ),
    );
  }
}
