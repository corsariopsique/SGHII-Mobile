import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sghii_mobile/Auth/auth_provider.dart';
import 'Layout/inventory_screen.dart';
import 'Auth/login_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SGHII Mobile Client',
        debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/inventory': (context) => InventoryScreen(),
      }
    );
  }
}