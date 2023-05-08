import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  Future<void> addCollectionUser(
      {required String? email, required String currentDate}) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users.add({
      "name": email,
      "tokens": 0,
      "completed": 0,
      "last_login": currentDate,
      "last_challenge": ""
    });
  }

  Future<void> updateUserLastLogin(
      {required String? email, required String lastLogin}) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    QuerySnapshot querySnap = await users.where("name", isEqualTo: email).get();
    String uid = querySnap.docs[0].id;
    DocumentReference userDoc =
        FirebaseFirestore.instance.collection('users').doc(uid);
    await userDoc.update({"last_login": lastLogin});
    await userDoc.update({"completed": 0});
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

  Future<void> updateUserLastDailyChallenge(
      {required String? email, required String? lastDailyChallenge}) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    QuerySnapshot querySnap = await users.where("name", isEqualTo: email).get();
    String uid = querySnap.docs[0].id;
    DocumentReference userDoc =
        FirebaseFirestore.instance.collection('users').doc(uid);
    await userDoc.update({'last_challenge': lastDailyChallenge});
  }

  Future<void> updateUserModules(
      {required String? email, required int modules}) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    QuerySnapshot querySnap = await users.where("name", isEqualTo: email).get();
    String uid = querySnap.docs[0].id;
    DocumentReference userDoc =
        FirebaseFirestore.instance.collection('users').doc(uid);
    await userDoc.update({'completed': modules});
  }
}
