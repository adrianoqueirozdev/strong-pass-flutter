import 'package:json_annotation/json_annotation.dart';

part 'password.g.dart';

class PasswordFields {
  static const String id = 'id';
  static const String name = 'name';
  static const String userId = 'userId';
  static const String currentUser = 'currentUser';
  static const String password = 'password';
  static const String passwordCategoryId = 'passwordCategoryId';
  static const String createdAt = 'createdAt';
  static const String isRemoved = 'isRemoved';
}

@JsonSerializable()
class Password {
  String? id;
  String? name;
  String? userId;
  String? currentUser;
  String? password;
  String? passwordCategoryId;
  String? createdAt;
  bool isRemoved;

  Password({
    this.id,
    this.name,
    this.userId,
    this.password,
    this.passwordCategoryId,
    this.createdAt,
    this.isRemoved = false,
  });

  factory Password.fromJson(Map<String, dynamic> json) => _$PasswordFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordToJson(this);
}
