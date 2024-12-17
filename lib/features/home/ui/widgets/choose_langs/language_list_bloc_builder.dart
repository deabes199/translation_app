import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_translation_app/features/home/data/models/langs_model.dart';
import 'package:google_translation_app/features/home/logic/cubit/home_cubit.dart';
import 'package:google_translation_app/features/home/ui/widgets/choose_langs/language_list_view.dart';

class LanguagesLisBlocBuilder extends StatelessWidget {
  final void Function(LangsModel) callback;
  const LanguagesLisBlocBuilder({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
   if (state is LanguageListSuccess ||
          state is SearchLanguageSuccess) {
        return LanguageList(
          languages: context.read<HomeCubit>().searchedLanguages,
          onTap: (langsModel) {
            callback(langsModel);
            Navigator.pop(context);
          },
        );
      } else if (state is LanguageListEmpty) {
        return const Text('empty');
      } else if (state is LanguageListFaluire) {
        return Text(state.message);
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}

