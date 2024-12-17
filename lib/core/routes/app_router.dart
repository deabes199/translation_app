import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_translation_app/core/di/dependancy_injection.dart';
import 'package:google_translation_app/core/routes/routes.dart';
import 'package:google_translation_app/features/home/logic/cubit/home_cubit.dart';
import 'package:google_translation_app/features/home/ui/screen/home_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<HomeCubit>(),
                  child: const HomeScreen(),
                ));
      

      default:
        const Scaffold(
          body: Center(child: Text('No route defined ')),
        );
    }
    return null;
  }
}
