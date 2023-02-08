import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

/// 
/// 
/// JSON Serializable Model
@JsonSerializable()
class User {
  final String id;
  final String name;
  final String gender;
  final String status;
  String? email;
  final String partner_id;
  final DateTime created_at;
  List? statistics;

  User(
    this.email,
    this.statistics, {
    required this.id,
    required this.created_at,
    required this.gender,
    required this.name,
    required this.partner_id,
    required this.status,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.name == name &&
        other.gender == gender &&
        other.status == status &&
        other.partner_id == partner_id &&
        other.created_at == created_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        gender.hashCode ^
        status.hashCode ^
        partner_id.hashCode ^
        created_at.hashCode;
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, gender: $gender, status: $status, email: $email, partner_id: $partner_id, created_at: $created_at, statistics: $statistics)';
  }
}
