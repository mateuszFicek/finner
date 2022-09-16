// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseClient {
  @singleton
  @Named("firebase_auth")
  FirebaseAuth get auth => FirebaseAuth.instance;
}

class $FirebaseClient extends FirebaseClient {}
