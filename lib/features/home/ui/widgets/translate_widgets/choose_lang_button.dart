import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_translation_app/core/helper/colors.dart';
import 'package:google_translation_app/features/home/data/models/langs_model.dart';
import 'package:google_translation_app/features/home/logic/cubit/home_cubit.dart';
import 'package:google_translation_app/features/home/ui/widgets/translate_widgets/language_button.dart';

class ChooseLangButton extends StatelessWidget {
  const ChooseLangButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Row(
          children: [
            LanguageButton(
              callback: (LangsModel langs) {
                BlocProvider.of<HomeCubit>(context).uodateFromLanguage(langs);
              },
              lang: BlocProvider.of<HomeCubit>(context).fromLngs.name,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                BlocProvider.of<HomeCubit>(context).swapLanguage();
              },
              icon: const Icon(
                Icons.compare_arrows,
                color: primaryColor,
              ),
            ),
            const Spacer(),
            LanguageButton(
              callback: (LangsModel langs) {
                BlocProvider.of<HomeCubit>(context).updateToLanguage(langs);
                
              },
                lang: BlocProvider.of<HomeCubit>(context).toLangs.name),
          ],
        );
      },
    );
  }
}
