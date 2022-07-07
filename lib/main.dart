import 'package:camera/camera.dart';
import 'package:fitness_gym/screens/akun/akun_view_model.dart';
import 'package:fitness_gym/screens/change_password/change_password_view_model.dart';
import 'package:fitness_gym/screens/dashboard/dashboard_view_model.dart';
import 'package:fitness_gym/screens/login/login_view_model.dart';
import 'package:fitness_gym/screens/payment/payment_view_model.dart';
import 'package:fitness_gym/screens/register/register_view_model.dart';
import 'package:fitness_gym/screens/splash/splash_screen.dart';
import 'package:fitness_gym/screens/splash/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await availableCameras();
  await initializeDateFormatting('id_ID', null)
      .then((_) => runApp(const MyApp()));
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
        ),
        ChangeNotifierProvider(
          create: (context) => DashboardViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => AkunViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => PaymentViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChangePasswordViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SplashViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        theme: ThemeData(
          fontFamily: 'Poppins',
          backgroundColor: const Color(0xFFFEFEFE),
        ),
      ),
    );
  }
}
