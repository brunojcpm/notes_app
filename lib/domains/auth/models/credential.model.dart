import 'dart:convert';

class CredentialModel {
  final String email;
  final String password;

  CredentialModel({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'email': email, 'password': password};
  }

  factory CredentialModel.fromMap(Map<String, dynamic> map) {
    return CredentialModel(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CredentialModel.fromJson(String source) =>
      CredentialModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
