// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseClient {
  @singleton
  @Named("firebase_auth")
  FirebaseAuth get auth => FirebaseAuth.instance;

  @singleton
  @Named("firebase_storage")
  FirebaseFirestore get storage => FirebaseFirestore.instance;
}

class $FirebaseClient extends FirebaseClient {}
