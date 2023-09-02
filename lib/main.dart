import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:portfolio/firebase_options.dart';
import 'package:portfolio/src/provider/contact_provider.dart';
import 'package:provider/provider.dart';
import 'package:portfolio/src/screens/landing/landing.dart';
import 'package:portfolio/theme/theme_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: ((context) => ThemeManager())),
    ChangeNotifierProvider(create: ((context) => ContactProvider())),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Selector<ThemeManager, ThemeMode>(
      selector: (_, theme) => theme.themeMode,
      builder: (context, themeMode, _) {
        return ResponsiveSizer(builder: (context, orientation, screenType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Chandrashekhar's Portfolio",
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeMode,
            home: const LandingPage(),
          );
        });
      },
    );
  }
}
