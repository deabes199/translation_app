import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:google_translation_app/core/netwoking/api/api_services.dart';
import 'package:google_translation_app/features/home/data/repo/home_repo.dart';
import 'package:google_translation_app/features/home/logic/cubit/home_cubit.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  Dio dio = Dio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}
