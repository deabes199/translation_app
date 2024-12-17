import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_translation_app/core/helper/colors.dart';
import 'package:google_translation_app/features/home/data/models/langs_model.dart';
import 'package:google_translation_app/features/home/logic/cubit/home_cubit.dart';

class LanguageList extends StatelessWidget {
  final List<LangsModel> languages;
  const LanguageList({
    super.key,
    required this.languages,
    required this.onTap,
  });
  final void Function(LangsModel) onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimationLimiter(
        child: ListView.builder(
            itemCount: context.read<HomeCubit>().searchedLanguages.length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 500),
                child: SlideAnimation(
                  horizontalOffset: 60,
                  child: FadeInAnimation(
                    child: Card(
                      color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        title: Text(
                          languages[index].name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          languages[index].code,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: primaryColor,
                        ),
                        onTap: () => onTap(languages[index]),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}