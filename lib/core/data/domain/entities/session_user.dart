import 'dart:convert';

import 'package:loomi_challange/core/data/domain/entities/user.dart';

class SessionUser extends AppUser {
  String token;

  SessionUser({
    required super.username,
    required super.email,
    super.id,
    super.blocked,
    super.confirmed,
    super.createdAt,
    super.updatedAt,
    super.provider,
    required this.token,
  });

  factory SessionUser.empty() {
    return SessionUser(
      id: 0,
      username: '',
      email: '',
      token: '',
      blocked: false,
      confirmed: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      provider: '',
    );
  }

  factory SessionUser.fromJson(String source) =>
      SessionUser.fromMap(json.decode(source));

  factory SessionUser.fromMap(Map<String, dynamic> json) {
    return SessionUser(
      id: json['id'] ?? 0,
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      provider: json['provider'] ?? '',
      confirmed: json['confirmed'] ?? false,
      blocked: json['blocked'] ?? false,
      createdAt: json['created_at'] ?? DateTime.now(),
      updatedAt: json['updated_at'] ?? DateTime.now(),
      token: json['jwt'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'provider': provider,
      'confirmed': confirmed,
      'blocked': blocked,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
      'jwt': token,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'SessionUser(id: $id, username: $username, email: $email, provider: $provider, confirmed: $confirmed, blocked: $blocked, createdAt: $createdAt, updatedAt: $updatedAt, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SessionUser &&
        other.id == id &&
        other.username == username &&
        other.email == email &&
        other.provider == provider &&
        other.confirmed == confirmed &&
        other.blocked == blocked &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.token == token;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        email.hashCode ^
        provider.hashCode ^
        confirmed.hashCode ^
        blocked.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        token.hashCode;
  }
}
