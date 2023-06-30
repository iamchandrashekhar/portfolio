import 'package:flutter/material.dart';
import 'package:portfolio/src/provider/landing_provider.dart';
import 'package:provider/provider.dart';
import 'package:portfolio/src/features/landing/landing.dart';
import 'package:portfolio/theme/theme_widget.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: ((context) => ThemeManager())),
    ChangeNotifierProvider(create: ((context) => LandingProvider())),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Selector<ThemeManager, ThemeMode>(
      selector: (_, theme) => theme.themeMode,
      builder: (context, themeMode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Chandrashekhar's Portfolio",
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          home: const LandingPage(),
        );
      },
    );
  }
}
