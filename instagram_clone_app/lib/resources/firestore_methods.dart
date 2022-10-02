import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone_app/models/post.dart';
import 'package:instagram_clone_app/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final _firestore = FirebaseFirestore.instance;

  // upload post
  Future<String> uplaodPost(
    String description,
    Uint8List file,
    String uid,
    String profImage,
    String username,
  ) async {
    String res = 'Some Error Occured';
    try {
      final photoUrl =
          await StorageMethods().uploadImageToStorage('post', file, true);
      String postId = const Uuid().v1();
      Post post = Post(
        description: description,
        uid: uid,
        username: username,
        postId: postId,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
        profImage: profImage,
        likes: [],
      );
      _firestore.collection('posts').doc(postId).set(
            post.toMap(),
          );
      res = 'Success';
      return res;
    } catch (e) {
      res = e.toString();
      return res;
    }
  }
}
