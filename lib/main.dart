import 'package:flutter/material.dart';
import 'package:flutter_app_assignment/providers/connectivity_provider.dart';
import 'package:flutter_app_assignment/providers/user_provider.dart';
import 'package:flutter_app_assignment/screens/home_screen.dart';
import 'package:flutter_app_assignment/widgets/connectivity_wrapper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => ConnectivityProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(1920, 1080), // Desktop design size for better web support
        minTextAdapt: true,
        splitScreenMode: true,
        ensureScreenSize: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter User App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            home: const ConnectivityWrapper(
              child: HomeScreen(),
            ),
          );
        },
      ),
    );
  }
}


