import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_translation_app/core/helper/colors.dart';

class ResultTranslation extends StatelessWidget {
  const ResultTranslation({super.key, required this.result});
  final String result;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                blurRadius: 12,
                offset: const Offset(0, 8)),
          ]),
      child: Row(
        children: [
          Expanded(
            child: Text(
              result,
              style:const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: result));
            },
            icon:const Icon(
              Icons.copy,
              color: primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
