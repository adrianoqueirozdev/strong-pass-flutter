import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseRepository {
  late final FirebaseFirestore _firestore;
  late final FirebaseAuth _auth;

  FirebaseFirestore get firestore => _firestore;
  FirebaseAuth get auth => _auth;

  BaseRepository() {
    _firestore = FirebaseFirestore.instance;

    _auth = FirebaseAuth.instance;
  }
}
