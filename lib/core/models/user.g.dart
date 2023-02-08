// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['email'] as String?,
      json['statistics'] as List<dynamic>?,
      id: json['id'] as String,
      created_at: DateTime.parse(json['created_at'] as String),
      gender: json['gender'] as String,
      name: json['name'] as String,
      partner_id: json['partner_id'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': instance.gender,
      'status': instance.status,
      'email': instance.email,
      'partner_id': instance.partner_id,
      'created_at': instance.created_at.toIso8601String(),
      'statistics': instance.statistics,
    };
