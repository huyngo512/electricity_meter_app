// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String id;
  String username;
  String? avatar;
  String? phone;
  String? state;
  String roleId;
  String? firstName;
  String? lastName;

  UserModel({
    required this.id,
    required this.username,
    this.avatar,
    this.phone,
    this.state,
    required this.roleId,
    this.firstName,
    this.lastName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      username: json['token'] as String,
      avatar: json['token'] as String?,
      phone: json['token'] as String?,
      state: json['token'] as String?,
      roleId: json['token'] as String,
      firstName: json['token'] as String?,
      lastName: json['token'] as String?,
    );
  }
}
