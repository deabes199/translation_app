import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_translation_app/core/di/dependancy_injection.dart';
import 'package:google_translation_app/core/helper/spacing.dart';
import 'package:google_translation_app/features/home/data/models/langs_model.dart';
import 'package:google_translation_app/features/home/logic/cubit/home_cubit.dart';
import 'package:google_translation_app/features/home/ui/widgets/choose_langs/app_bar_langs.dart';
import 'package:google_translation_app/features/home/ui/widgets/choose_langs/language_list_bloc_builder.dart';
import 'package:google_translation_app/features/home/ui/widgets/choose_langs/search_bar.dart';

class SelectLanguageScreen extends StatelessWidget {
  final void Function(LangsModel) callback;
  const SelectLanguageScreen({
    super.key,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..loadLanguages(),
      child: Scaffold(
        appBar: appBarLangs(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Column(
              children: [
                 SearchLanguage(),
                verticalSpace(16),
                LanguagesLisBlocBuilder(
                  callback: (lang) {
                    callback(lang);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


