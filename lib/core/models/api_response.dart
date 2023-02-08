import 'package:json_annotation/json_annotation.dart';
import 'package:owwn_coding_challenge/core/models/user.dart';

part 'api_response.g.dart';

/// 
/// 
/// JSON Serializable Model
@JsonSerializable()
class ApiResponse {
  final List<User> users;
  final int total;

  ApiResponse(this.users, this.total);
  
  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}
