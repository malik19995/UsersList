// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) => ApiResponse(
      (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total'] as int,
    );

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
    <String, dynamic>{
      'users': instance.users,
      'total': instance.total,
    };
