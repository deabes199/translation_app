import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_translation_app/core/helper/colors.dart';
import 'package:google_translation_app/features/home/logic/cubit/home_cubit.dart';

// ignore: must_be_immutable
class SearchLanguage extends StatelessWidget {
   SearchLanguage({super.key, });

  TextEditingController searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey[600]),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.white,
            prefixIcon:const Icon(
              Icons.search,
              color: primaryColor,
            ),
            contentPadding:const EdgeInsets.symmetric(vertical: 14),
          ),
          onChanged: (value) => context.read<HomeCubit>().searchLanguages(value),
        );
      },
    );
  }
}
