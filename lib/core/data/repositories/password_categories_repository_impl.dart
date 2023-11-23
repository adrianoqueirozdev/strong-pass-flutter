import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:strong_pass/core/data/models/password_category.dart';
import 'package:strong_pass/core/domain/repositories/password_categories_repository.dart';
import 'package:strong_pass/shared/constants/firebase_keys.dart';

class PasswordCategoriesRepositoryImpl extends PasswordCategoriesRepository {
  @override
  Future<List<PasswordCategory>> loadCategories() async {
    final QuerySnapshot query =
        await firestore.collection(FirebaseKeys.categories).orderBy(PasswordCategoryFields.name).get();

    return query.docs.map((doc) => PasswordCategory.fromJson(jsonDecode(jsonEncode(doc.data())))).toList();
  }

  @override
  Future<void> incrementCategoryCountPasswords(String categoryId) async {
    final CollectionReference collectionRef = firestore.collection(FirebaseKeys.categories);

    await collectionRef.doc(categoryId).update({PasswordCategoryFields.totalPasswords: FieldValue.increment(1)});
  }
}
