import 'package:flutter/material.dart';
import 'pages/login/google_login_handler.dart';
import 'package:provider/provider.dart';
import 'models/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAHxGvdt3eusbImv5FhkqxglS1ANMFnupc",
      authDomain: "report-75ef0.firebaseapp.com",
      projectId: "report-75ef0",
      storageBucket: "report-75ef0.appspot.com",
      messagingSenderId: "795818918492",
      appId: "1:795818918492:web:c73f41a660da4dfb589c99",
      measurementId: "G-RGGPZQM0E0",
    ),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          theme: themeProvider.currentTheme,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Firebase Web App',
          home: const GoogleSignInScreen(),
        );
      },
    );
  }
}
