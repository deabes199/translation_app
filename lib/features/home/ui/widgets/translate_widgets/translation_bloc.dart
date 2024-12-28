
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_translation_app/features/home/logic/cubit/home_cubit.dart';
import 'package:google_translation_app/features/home/ui/widgets/translate_widgets/result_translation.dart';

class TranslationBloc extends StatelessWidget {
  const TranslationBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state is HomeSuccessState) {
       return ResultTranslation(
          result: state.translationModel.translation,
        );
      } 
       else if (state is HomeFaliureState) {
       return Center(
          child: Text(state.message),
        );
      } else {
      return const SizedBox.shrink();
      }
    });
  }
}