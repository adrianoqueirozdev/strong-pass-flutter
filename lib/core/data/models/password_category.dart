import 'package:json_annotation/json_annotation.dart';

part 'password_category.g.dart';

@JsonEnum()
enum PasswordCategoryType {
  sites,
  socialNetworks,
  applications,
  devices,
  networks,
  files,
  others,
}

class PasswordCategoryFields {
  static const String id = 'id';
  static const String name = 'name';
  static const String type = 'type';
  static const String totalPasswords = 'totalPasswords';
  static const String totalCountPasswords = 'totalCountPasswords';
}

@JsonSerializable()
class PasswordCategory {
  String? id;
  String? name;
  String? type;
  int? totalPasswords;

  PasswordCategory({
    this.id,
    this.name,
    this.type,
    this.totalPasswords = 0,
  });

  factory PasswordCategory.fromJson(Map<String, dynamic> json) => _$PasswordCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordCategoryToJson(this);
}
