import 'dart:convert';

import 'package:collection/collection.dart';

class User {
  final String uid;
  final String username;
  final String email;
  final String bio;
  final String photoUrl;
  final List followers;
  final List following;
  User({
    required this.uid,
    required this.username,
    required this.email,
    required this.bio,
    required this.photoUrl,
    required this.followers,
    required this.following,
  });

  User copyWith({
    String? uid,
    String? username,
    String? email,
    String? bio,
    String? photoUrl,
    List? followers,
    List? following,
  }) {
    return User(
      uid: uid ?? this.uid,
      username: username ?? this.username,
      email: email ?? this.email,
      bio: bio ?? this.bio,
      photoUrl: photoUrl ?? this.photoUrl,
      followers: followers ?? this.followers,
      following: following ?? this.following,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'username': username});
    result.addAll({'email': email});
    result.addAll({'bio': bio});
    result.addAll({'photoUrl': photoUrl});
    result.addAll({'followers': followers});
    result.addAll({'following': following});

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      bio: map['bio'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
      followers: List.from(map['followers']),
      following: List.from(map['following']),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(uid: $uid, username: $username, email: $email, bio: $bio, photoUrl: $photoUrl, followers: $followers, following: $following)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is User &&
        other.uid == uid &&
        other.username == username &&
        other.email == email &&
        other.bio == bio &&
        other.photoUrl == photoUrl &&
        listEquals(other.followers, followers) &&
        listEquals(other.following, following);
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        username.hashCode ^
        email.hashCode ^
        bio.hashCode ^
        photoUrl.hashCode ^
        followers.hashCode ^
        following.hashCode;
  }
}
