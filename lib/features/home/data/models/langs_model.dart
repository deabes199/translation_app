class LangsModel {
  late final String name;
  final String code;

  LangsModel({required this.name, required this.code});
  factory LangsModel.fromJson(Map<String, dynamic> json) {
    return LangsModel(name: json['name'] as String, code: json['code']as String);
  }
}
