part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeSuccessState extends HomeState {
  final TranslationModel translationModel;

  HomeSuccessState(this.translationModel);
}

final class HomeFaliureState extends HomeState {
  final String message;

  HomeFaliureState(this.message);
}

final class TranslationUpdateLanguages extends HomeState {}


final class LanguageListEmpty extends HomeState {}
final class SearchLanguageSuccess extends HomeState {}

final class LanguageListSuccess extends HomeState {
  final List<LangsModel> langList;

  LanguageListSuccess(this.langList);
}

final class LanguageListFaluire extends HomeState {
  final String message;

  LanguageListFaluire(this.message);
}
