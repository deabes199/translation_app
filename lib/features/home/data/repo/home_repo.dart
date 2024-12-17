import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:google_translation_app/core/helper/constant.dart';
import 'package:google_translation_app/core/netwoking/api/api_services.dart';
import 'package:google_translation_app/core/netwoking/errors/api_error_handler.dart';
import 'package:google_translation_app/core/netwoking/errors/error_model.dart';
import 'package:google_translation_app/features/home/data/models/langs_model.dart';
import 'package:google_translation_app/features/home/data/models/translation_model.dart';

class HomeRepo {
  final ApiServices apiServices;

  HomeRepo(this.apiServices);
  Future<Either<ErrorModel, TranslationModel>> translate(
    String to,
    String from,
    String text,
  ) async {
    try {
      final response = await apiServices.post(
        endpoint: 'free-google-translator',
        params: {'from': from, 'to': to, 'query': text},
        optaion: Options(
          headers: {
            'Content-Type': 'application/json',
            'x-rapidapi-host': 'free-google-translator.p.rapidapi.com',
            'x-rapidapi-key': apiKey
          },
        ),
        data: {'translate': 'rapidapi'},
      );
      if (response.data != null) {
        if (response.statusCode == 200) {
          final translate = TranslationModel.fromJson(response.data);
          return right(translate);
        } else {
          final errorMessage =
              response.data['message'] ?? 'Failed to load translation data';
          return left(errorMessage);
        }
      } else {
        return left(ApiErrorHandler('No data received'));
      }
    } on DioException catch (e) {
      return left(ApiErrorHandler.fromDioException(e));
    }
  }

  Future<List<LangsModel>> loadLang() async {
    try {
      final response =
          await rootBundle.loadString('assets/langs/langs_list.json');
      final Map<String, dynamic> jsonData = jsonDecode(response);
      final List<dynamic> data = jsonData['languages'];

      return data.map((lang) => LangsModel.fromJson(lang)).toList();
    } catch (error) {
      throw Exception('Failed to load languages: $error');
    }
  }
}
