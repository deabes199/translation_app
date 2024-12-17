import 'package:flutter/material.dart';
import 'package:google_translation_app/core/helper/colors.dart';
import 'package:google_translation_app/features/home/data/models/langs_model.dart';
import 'package:google_translation_app/features/home/ui/screen/select_language_screen.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key, required this.lang, required this.callback});
  final String lang;
   final void Function(LangsModel) callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  SelectLanguageScreen(
          callback: callback,
        )));
      },
      child: Container(
        height: 50,
        width: 140,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.shade700.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            lang,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
