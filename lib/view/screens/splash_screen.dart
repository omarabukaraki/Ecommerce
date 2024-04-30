import 'package:flutter/material.dart';
import '../../core/constant/app_colors.dart';
import '../widgets/splash_screen_body.dart';
import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return const LoginPage();
        },
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.kPrimary,
      body: SplashScreenBody(),
    );
  }
}
