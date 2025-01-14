import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_translation_app/core/helper/colors.dart';
import 'package:google_translation_app/core/helper/spacing.dart';
import 'package:google_translation_app/core/routes/app_router.dart';
import 'package:google_translation_app/core/theme/theme_cubit.dart';
import 'package:google_translation_app/features/home/ui/widgets/translate_widgets/choose_lang_button.dart';
import 'package:google_translation_app/features/home/ui/widgets/translate_widgets/input_text_translate.dart';
import 'package:google_translation_app/features/home/ui/widgets/translate_widgets/translation_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Translate ',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        backgroundColor: primaryColor,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                showDialogTheme(context, themeCubit);
              },
              icon: Icon(
                Icons.mode_night,
                color: Colors.white,
              ))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                verticalSpace(10),
                const ChooseLangButton(),
                verticalSpace(16),
                const InputTextTranslate(),
                verticalSpace(20),
                const TranslationBloc()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showDialogTheme(BuildContext context, ThemeCubit themeCubit) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Change Theme'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.light_mode),
                title: Text('Light'),
                trailing: themeCubit.state == ThemeMode.light
                    ? Icon(Icons.check)
                    : null,
                onTap: () {
                  themeCubit.saveTheme(ThemeMode.light);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.dark_mode),
                title: Text('Dark'),
                trailing: themeCubit.state == ThemeMode.dark
                    ? Icon(Icons.check)
                    : null,
                onTap: () {
                  themeCubit.saveTheme(ThemeMode.dark);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.mode),
                title: Text('Dark'),
                trailing: themeCubit.state == ThemeMode.system
                    ? Icon(Icons.check)
                    : null,
                onTap: () {
                  themeCubit.saveTheme(ThemeMode.system);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      });
}
