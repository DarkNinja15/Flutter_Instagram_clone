import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // add image to firebase storage
  Future<String> uploadImageToStorage(
      String childname, Uint8List file, bool isPost) async {
    // create folder name childname and inside that created a folder of userid in which file is stored
    Reference ref = await firebaseStorage
        .ref()
        .child(childname)
        .child(_auth.currentUser!.uid);

    // when it is a post we create diffrent uid for diffrent posts.
    if (isPost) {
      String id = const Uuid().v1();
      ref = ref.child(id);
    }

    // putting file in uid folder.
    UploadTask uploadTask = ref.putData(file);
    // await the uploadtask
    TaskSnapshot snap = await uploadTask;
    // getting downloadUrl
    String downloadUrl = (await snap.ref.getDownloadURL()).toString();
    return downloadUrl;
  }
}
