import 'package:flutter/material.dart';
import 'package:google_translation_app/core/helper/colors.dart';
import 'package:google_translation_app/core/helper/spacing.dart';
import 'package:google_translation_app/features/home/ui/widgets/translate_widgets/choose_lang_button.dart';
import 'package:google_translation_app/features/home/ui/widgets/translate_widgets/input_text_translate.dart';
import 'package:google_translation_app/features/home/ui/widgets/translate_widgets/translate_button.dart';
import 'package:google_translation_app/features/home/ui/widgets/translate_widgets/translation_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Translate ',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        backgroundColor: primaryColor,
        elevation: 0,
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
                InputTextTranslate(),
                verticalSpace(20),
              const  TranslateButton(),
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

