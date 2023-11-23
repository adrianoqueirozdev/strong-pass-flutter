import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:strong_pass/core/data/models/password.dart';
import 'package:strong_pass/core/domain/repositories/password_repository.dart';
import 'package:strong_pass/shared/constants/firebase_keys.dart';

class PasswordRepositoryImpl extends PasswordRepository {
  @override
  Future<void> createPassword(Password password) async {
    await firestore.collection(FirebaseKeys.passwords).add(password.toJson()).then((data) {
      _updateId(data.id, FirebaseKeys.passwords);
    });
  }

  @override
  Future<void> deletePassword(String id) async {
    CollectionReference collectionRef = FirebaseFirestore.instance.collection(FirebaseKeys.passwords);
    return await collectionRef.doc(id).update({PasswordFields.isRemoved: true});
  }

  @override
  Future<List<Password>> loadPasswordsByCategory(String categoryId) async {
    final userUid = auth.currentUser!.uid;

    final QuerySnapshot query = await firestore
        .collection(FirebaseKeys.passwords)
        .where(PasswordFields.isRemoved, isEqualTo: false)
        .where(PasswordFields.passwordCategoryId, isEqualTo: categoryId)
        .where(PasswordFields.currentUser, isEqualTo: userUid)
        .orderBy(PasswordFields.createdAt, descending: true)
        .get();

    return query.docs.map((doc) => Password.fromJson(jsonDecode(jsonEncode(doc.data())))).toList();
  }

  @override
  Future<void> updatePassword(Password password) async {
    CollectionReference collectionRef = FirebaseFirestore.instance.collection(FirebaseKeys.passwords);
    return await collectionRef.doc(password.id).update(password.toJson());
  }

  Future<void> _updateId(String id, String collectionName) async {
    CollectionReference collectionRef = FirebaseFirestore.instance.collection(collectionName);
    return await collectionRef.doc(id).update({PasswordFields.id: id});
  }
}
