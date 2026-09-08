import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:noteflow/core/constants/app_constants.dart';
import 'package:noteflow/core/errors/app_exceptions.dart';
import 'package:noteflow/core/helper/prefs_helper.dart';
import 'package:noteflow/features/auth/data/models/create_user_model.dart';
import 'package:noteflow/features/auth/data/models/login_user_model.dart';
import 'package:noteflow/features/auth/data/models/user_model.dart';

abstract class AuthRemote {
  Future<UserModel> signUp({
    required CreateUserModel user,
  });

  Future<String> login({
    required LoginUserModel user,
  });
  Future<void> addUser({required UserModel user});
  Future<UserModel> getUser({required String userId});
  Future<void> saveUser({required UserModel user});
}

class AuthFirebaseDataSource implements AuthRemote {
  final collection = FirebaseFirestore.instance.collection(AppConstants.dbUser);

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
  Future<UserModel> signUp({
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

      return UserModel(
        id: credential.user!.uid,
        name: user.name,
        email: user.email,
        createAt: DateTime.now().toString(),
      );
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
  Future<void> addUser({required UserModel user}) async {
    await collection.add(user.toMap());
  }

  @override
  Future<UserModel> getUser({required String userId}) async {
    try {
      final res = await collection.doc(userId).get();

      final data = res.data();

      if (data == null) {
        throw ServerException(
          message: 'المستخدم غير موجود',
        );
      }

      return UserModel.fromMap(data);
    } on FirebaseException catch (e) {
      if (e.code == 'permission-denied') {
        throw ServerException(
          message: 'ليس لديك صلاحية للوصول إلى هذا المستند.',
        );
      } else if (e.code == 'not-found') {
        throw ServerException(
          message: 'المستند غير موجود.',
        );
      } else {
        throw ServerException(
          message: 'حدث خطأ أثناء الاتصال بقاعدة البيانات.',
        );
      }
    }
  }

  @override
  Future<void> saveUser({required UserModel user}) async {
    await PrefsHelper.saveUser(user.toMap());
  }
}
