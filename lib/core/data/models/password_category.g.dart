// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordCategory _$PasswordCategoryFromJson(Map<String, dynamic> json) =>
    PasswordCategory(
      id: json['id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      totalPasswords: json['totalPasswords'] as int? ?? 0,
    );

Map<String, dynamic> _$PasswordCategoryToJson(PasswordCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'totalPasswords': instance.totalPasswords,
    };
