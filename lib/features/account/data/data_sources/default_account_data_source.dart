// Package imports:
import 'package:dartz/dartz.dart';
import 'package:finner/features/account/domain/use_cases/create_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../../utils/failure.dart';
import '../../../../utils/network.dart';
import '../../domain/data_sources/account_data_source.dart';

// Project imports:

@Injectable(as: AccountDataSource)
class DefaultAccountDataSource implements AccountDataSource {
  final FirebaseAuth auth;

  DefaultAccountDataSource(@Named('firebase_auth') this.auth);

  @override
  Future<Either<Failure, User?>> loginUser(
      String email, String password) async {
    try {
      final r = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return right(r.user);
    } on FirebaseAuthException catch (e) {
      return left(Failure(e.message ?? "Couldn't sign in with credentials."));
    } catch (e) {
      return left(const Failure("Couldn't sign in with credentials."));
    }
  }

  @override
  Future<Either<Failure, User?>> createUser(
      String email, String password) async {
    try {
      final r = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(r.user);
    } on FirebaseAuthException catch (e) {
      return left(Failure(e.message ?? "Couldn't create account."));
    } catch (e) {
      return left(const Failure("Couldn't create account."));
    }
  }

  @override
  Future<Either<Failure, User?>> authorizeWithGoogle() async {
    try {
      final r = await auth.signInWithAuthProvider(GoogleAuthProvider());
      return right(r.user);
    } on FirebaseAuthException catch (e) {
      return left(Failure(e.message ?? "Couldn't sign in with Google."));
    } catch (e) {
      return left(const Failure("Couldn't sign in with Google."));
    }
  }
}
