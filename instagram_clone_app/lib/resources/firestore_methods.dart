import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:instagram_clone_app/models/post.dart';
import 'package:instagram_clone_app/providers/user_provider.dart';
import 'package:instagram_clone_app/resources/storage_methods.dart';
import 'package:provider/provider.dart';
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

  // add like post
  Future<void> likePost(String postId, String uid, List likes) async {
    try {
      if (likes.contains(uid)) {
        await _firestore.collection('posts').doc(postId).update(
          {
            'likes': FieldValue.arrayRemove([uid]),
          },
        );
      } else {
        await _firestore.collection('posts').doc(postId).update(
          {
            'likes': FieldValue.arrayUnion([uid]),
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // comment post
  Future<void> commentPost(String postId, String text, String uid, String name,
      String profilePic) async {
    try {
      if (text.isNotEmpty) {
        String commentId = const Uuid().v1();
        await _firestore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .set({
          'postId': postId,
          'comment': text,
          'commentId': commentId,
          'uid': uid,
          'profilePic': profilePic,
          'name': name,
          'datePublished': DateTime.now(),
        });
      } else {
        print('empty text');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // delete Post
  Future<void> deletePost(String postId) async {
    try {
      await _firestore.collection('posts').doc(postId).delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
