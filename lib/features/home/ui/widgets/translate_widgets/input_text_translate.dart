import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_translation_app/core/helper/colors.dart';
import 'package:google_translation_app/core/helper/spacing.dart';
import 'package:google_translation_app/features/home/logic/cubit/home_cubit.dart';

class InputTextTranslate extends StatelessWidget {
  const InputTextTranslate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Enter text to translate:',
            style: TextStyle(fontSize: 20),
          ),
        ),
        verticalSpace(20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 15,
                    offset: const Offset(0, 8))
              ]),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  controller: context.read<HomeCubit>().textController,
                  maxLines: 5,
                  minLines: 1,
                  onChanged: (value) {
                    if (value.trim().isNotEmpty) {
                      BlocProvider.of<HomeCubit>(context).translate();
                    }
                  },
                  decoration: const InputDecoration(
                      hintText: 'Enter text',
                      hintStyle: TextStyle(color: Colors.black, fontSize: 16),
                      border: InputBorder.none),
                ),
              ),
              IconButton(
                  onPressed: () async {
                    ClipboardData? clipboardData =
                        await Clipboard.getData('text/plain');
                    if (clipboardData != null) {
                      // ignore: use_build_context_synchronously
                      context.read<HomeCubit>().textController.text =
                          clipboardData.text!;
                    }
                  },
                  icon: const Icon(
                    Icons.paste,
                    color: primaryColor,
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
