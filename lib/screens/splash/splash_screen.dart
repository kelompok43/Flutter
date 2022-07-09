import 'dart:async';

import 'package:fitness_gym/screens/dashboard/dashboard_screen.dart';
import 'package:fitness_gym/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'splash_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<SplashViewModel>(context, listen: false).getDataUser(context);
    });
    // Timer(const Duration(seconds: 1), () async {
    //   String? data = await getData();
    //   if (data != null && data.isNotEmpty) {
    //     Navigator.pushAndRemoveUntil(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => const DashboardScreen(),
    //         ),
    //         (route) => false);
    //   } else {
    //     Navigator.pushAndRemoveUntil(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => const WelcomeScreen(),
    //         ),
    //         (route) => false);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: SvgPicture.asset("assets/icons/splash.svg"),
        ),
      ),
    );
  }
}
