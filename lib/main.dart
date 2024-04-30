import 'dart:async';
import 'package:ecommerce/controller/firebase_auth_methods.dart';
import 'package:ecommerce/providers/category_provider.dart';
import 'package:ecommerce/providers/double_sub_category_provider.dart';
import 'package:ecommerce/providers/sub_category_provider.dart';
import 'package:ecommerce/providers/user_provider.dart';
import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:ecommerce/view/screens/home_page.dart';
import 'package:ecommerce/view/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/constant/app_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => SubCategoryProvider()),
        ChangeNotifierProvider(
            create: (context) => DoubleSubCategoryProvider()),
        Provider<FirebaseAuthMethods>(
            create: (context) => FirebaseAuthMethods()),
        StreamProvider(
            create: (context) => context.read<FirebaseAuthMethods>().authState,
            initialData: null)
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ecommerce',
          theme: ThemeData(
            fontFamily: 'SignikaNegative',
            colorScheme: ColorScheme.fromSeed(seedColor: AppColor.kPrimary),
            useMaterial3: true,
          ),
          routes: AppRoutes.route,
          home: FirebaseAuth.instance.currentUser != null
              ? const HomePage()
              : const SplashScreen()),
    );
  }
}
