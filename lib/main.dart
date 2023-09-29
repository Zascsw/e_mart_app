import 'package:e_mart_app/components/cart_add.dart';

import 'package:e_mart_app/views/auth_screen/login_screen.dart';
import 'package:e_mart_app/views/auth_screen/signup_screen.dart';
import 'package:e_mart_app/views/auth_screen/verify_email_screen.dart';
import 'package:e_mart_app/views/home_screen/home_screen.dart';
import 'package:e_mart_app/views/splash_screen/splash_screen.dart';
import 'package:e_mart_app/widgets_common/firebase_stream.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'consts/consts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
        ),
        fontFamily: regular,
      ),
      // return MultiProvider(
      //     providers: [
      //       ChangeNotifierProvider<CartProvider>(
      //         create: (context) => CartProvider(),
      //       ),
      //       ChangeNotifierProvider<ProductProvider>(
      //         create: (context) => ProductProvider(),
      //       ),
      //     ],
      // child
      routes: {
        '/': (context) => const FirebaseStream(),
        '/home': (context) => const HomeScreen(),
        // '/account': (context) => const AccountScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        //  '/reset_password': (context) => const ResetPasswordScreen(),
        '/verify_email': (context) => const VerifyEmailScreen(),
      },
      initialRoute: '/',
    );
  }
}
