import 'package:firebase_auth/firebase_auth.dart';
import 'package:noteflow/core/errors/app_exceptions.dart';
import 'package:noteflow/features/auth/data/models/create_user_model.dart';
import 'package:noteflow/features/auth/data/models/login_user_model.dart';

abstract class AuthRemote {
  Future<String> signUp({
    required CreateUserModel user,
  });

  Future<String> login({
    required LoginUserModel user,
  });
}

class AuthFirebaseDataSource implements AuthRemote {
  @override
  Future<String> login({
    required LoginUserModel user,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      final firebaseUser = credential.user;

      if (firebaseUser == null) {
        throw ServerException(
          message: 'تعذر الحصول على بيانات المستخدم',
        );
      }

      return firebaseUser.uid;
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException.fromCode(e.code);
    } on AppException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<String> signUp({
    required CreateUserModel user,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email,
            password: user.password,
          );

      final firebaseUser = credential.user;

      if (firebaseUser == null) {
        throw ServerException(
          message: 'تعذر الحصول على بيانات المستخدم',
        );
      }

      return firebaseUser.uid;
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException.fromCode(e.code);
    } on AppException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }
}
