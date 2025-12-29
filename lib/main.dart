import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:puja_applixation/Pandit/screens/Dashboard/p_dashboard.dart';
import 'package:puja_applixation/customer/screens/Dashboard/dashboard.dart';
import 'package:puja_applixation/screens/Auth/login_screen.dart';
import 'package:puja_applixation/screens/Auth/register.dart';
import 'package:puja_applixation/screens/Auth/registerstepone.dart';
import 'package:puja_applixation/screens/Landing/landing_screen.dart';

void main() async {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: LandingPage(),
      routes: {
        '/customerDashboard': (context) => CustomerDashboard(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegistrationScreen(),
        '/registerStepOne': (context) => CreateAccountCard(),
        '/panditDashboard': (context) => PanditDashboard(),
      },
    );
  }
}
