class TranslationModel {
  final int status;
  final String query;
  final String translation;
  final String translateTo;

  TranslationModel(
      {required this.status,
      required this.query,
      required this.translation,
      required this.translateTo});
  factory TranslationModel.fromJson(Map<String, dynamic> json) {
    return TranslationModel(
        status: json['status'],
        query: json['query'],
        translation: json['translation'],
        translateTo: json['translateTo']);
  }
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'query': query,
      'translateTo': translateTo,
      'translation': translation,
    };
  }
}
