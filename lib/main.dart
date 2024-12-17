import 'package:flutter/material.dart';
import 'package:google_translation_app/core/di/dependancy_injection.dart';
import 'package:google_translation_app/core/routes/app_router.dart';
import 'package:google_translation_app/core/routes/routes.dart';

void main() async {
  await setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.homeScreen,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter().onGenerateRoute,
    );
  }
}
