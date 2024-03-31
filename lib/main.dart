import 'package:flutter/material.dart';
import 'package:movie_ui/feature/login.dart';

import 'core/route/app_route.dart';
import 'core/route/app_route_name.dart';
import 'core/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movie Tickets",

      /// by using this setting, UI will automatic support dark and light mode
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      initialRoute: AppRouteName.loginScreen,
      onGenerateRoute: AppRoute.generate,
      home: const LoginScreen(),
    );
  }
}
