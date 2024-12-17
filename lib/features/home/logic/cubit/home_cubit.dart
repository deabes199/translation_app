import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_translation_app/features/home/data/models/langs_model.dart';
import 'package:google_translation_app/features/home/data/models/translation_model.dart';
import 'package:google_translation_app/features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;
  TextEditingController textController = TextEditingController();
  LangsModel fromLngs = LangsModel(name: 'English', code: 'en');
  LangsModel toLangs = LangsModel(name: 'Arabic', code: 'ar');
  List<LangsModel> languages = [];
  List<LangsModel> searchedLanguages = [];
  Future<void> translate() async {
    final response = await homeRepo.translate(
        toLangs.code, fromLngs.code, textController.text);
    response.fold((error) {
      emit(HomeFaliureState(error.message));
    }, (translate) {
      emit(HomeSuccessState(translate));
    });
  }

  loadLanguages() async {
  
    try {
      final response = await homeRepo.loadLang();
      if (response.isEmpty) {
        emit(LanguageListEmpty());
      } else {
        languages = response;
        searchedLanguages = languages;

        emit(LanguageListSuccess(response));
      }
    } catch (error) {
      emit(LanguageListFaluire(error.toString()));
    }
  }

  searchLanguages(String text) {
    if (text.isEmpty) {
      searchedLanguages = languages;
    }
    searchedLanguages = languages
        .where((language) =>
            language.name.toLowerCase().startsWith(text.toLowerCase()))
        .toList();
    emit(SearchLanguageSuccess());
  }

  uodateFromLanguage(LangsModel language) {
    fromLngs = language;
    emit(TranslationUpdateLanguages());
  }

  updateToLanguage(LangsModel language) {
    toLangs = language;
    emit(TranslationUpdateLanguages());
  }

  swapLanguage() {
    final temp = fromLngs;
    fromLngs = toLangs;
    toLangs = temp;
    emit(TranslationUpdateLanguages());
  }
}
