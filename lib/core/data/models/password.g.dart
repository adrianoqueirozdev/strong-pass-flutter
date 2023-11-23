// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Password _$PasswordFromJson(Map<String, dynamic> json) => Password(
      id: json['id'] as String?,
      name: json['name'] as String?,
      userId: json['userId'] as String?,
      password: json['password'] as String?,
      passwordCategoryId: json['passwordCategoryId'] as String?,
      createdAt: json['createdAt'] as String?,
      isRemoved: json['isRemoved'] as bool? ?? false,
    )..currentUser = json['currentUser'] as String?;

Map<String, dynamic> _$PasswordToJson(Password instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userId': instance.userId,
      'currentUser': instance.currentUser,
      'password': instance.password,
      'passwordCategoryId': instance.passwordCategoryId,
      'createdAt': instance.createdAt,
      'isRemoved': instance.isRemoved,
    };
