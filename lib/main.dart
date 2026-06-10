import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickslot_flutter/screens/login/login_screen.dart';

import 'providers/venue_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              VenueProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(
      BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
      false,
      home: LoginScreen(),
    );
  }
}