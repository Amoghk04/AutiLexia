import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  Future<void> addCollectionUser({required String? email}) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users.add({"name": email, "tokens": 0});
  }

  Future<void> updateUserTokens(
      {required String? email, required int tokens}) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    QuerySnapshot querySnap = await users.where("name", isEqualTo: email).get();
    String uid = querySnap.docs[0].id;
    DocumentReference userDoc =
        FirebaseFirestore.instance.collection('users').doc(uid);
    await userDoc.update({"tokens": tokens});
  }

  Future<int> getUserTokens({required String? email}) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    QuerySnapshot querySnap = await users.where("name", isEqualTo: email).get();
    String uid = querySnap.docs[0].id;
    DocumentReference userDoc =
        FirebaseFirestore.instance.collection('users').doc(uid);
    int tokens = 0;
    await userDoc
        .get()
        .then((value) => tokens = value.get('tokens'))
        .onError((error, stackTrace) => print("Error: $error"));
    return tokens;
  }
}
