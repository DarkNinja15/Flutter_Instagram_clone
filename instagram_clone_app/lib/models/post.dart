import 'dart:convert';

class Post {
  final String description;
  final String uid;
  final String username;
  final String postId;
  final datePublished;
  final String postUrl;
  final String profImage;
  final likes;
  Post({
    required this.description,
    required this.uid,
    required this.username,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
    required this.likes,
  });

  Post copyWith({
    String? description,
    String? uid,
    String? username,
    String? postId,
    String? datePublished,
    String? postUrl,
    String? profImage,
    int? likes,
  }) {
    return Post(
      description: description ?? this.description,
      uid: uid ?? this.uid,
      username: username ?? this.username,
      postId: postId ?? this.postId,
      datePublished: datePublished ?? this.datePublished,
      postUrl: postUrl ?? this.postUrl,
      profImage: profImage ?? this.profImage,
      likes: likes ?? this.likes,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'description': description});
    result.addAll({'uid': uid});
    result.addAll({'username': username});
    result.addAll({'postId': postId});
    result.addAll({'datePublished': datePublished});
    result.addAll({'postUrl': postUrl});
    result.addAll({'profImage': profImage});
    result.addAll({'likes': likes});

    return result;
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      description: map['description'] ?? '',
      uid: map['uid'] ?? '',
      username: map['username'] ?? '',
      postId: map['postId'] ?? '',
      datePublished: map['datePublished'] ?? '',
      postUrl: map['postUrl'] ?? '',
      profImage: map['profImage'] ?? '',
      likes: map['likes']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(description: $description, uid: $uid, username: $username, postId: $postId, datePublished: $datePublished, postUrl: $postUrl, profImage: $profImage, likes: $likes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Post &&
        other.description == description &&
        other.uid == uid &&
        other.username == username &&
        other.postId == postId &&
        other.datePublished == datePublished &&
        other.postUrl == postUrl &&
        other.profImage == profImage &&
        other.likes == likes;
  }

  @override
  int get hashCode {
    return description.hashCode ^
        uid.hashCode ^
        username.hashCode ^
        postId.hashCode ^
        datePublished.hashCode ^
        postUrl.hashCode ^
        profImage.hashCode ^
        likes.hashCode;
  }
}
