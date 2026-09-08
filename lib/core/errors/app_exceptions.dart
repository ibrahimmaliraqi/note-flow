import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class AppException implements Exception {
  final String message;

  const AppException({
    required this.message,
  });

  @override
  String toString() {
    return 'AppException: $message';
  }
}

class ServerException extends AppException {
  const ServerException({
    required super.message,
  });
}

class NetworkException extends AppException {
  const NetworkException({
    super.message = 'لا يوجد اتصال بالإنترنت',
  });
}

class CacheException extends AppException {
  const CacheException({
    required super.message,
  });
}

class AuthException extends AppException {
  const AuthException({
    required super.message,
  });
}

class AppFirebaseAuthException extends AppException {
  const AppFirebaseAuthException({
    required super.message,
  });

  factory AppFirebaseAuthException.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const AppFirebaseAuthException(
          message: 'البريد الإلكتروني غير صحيح',
        );

      case 'user-disabled':
        return const AppFirebaseAuthException(
          message: 'تم تعطيل هذا الحساب',
        );

      case 'user-not-found':
        return const AppFirebaseAuthException(
          message: 'لا يوجد حساب بهذا البريد الإلكتروني',
        );

      case 'wrong-password':
        return const AppFirebaseAuthException(
          message: 'كلمة المرور غير صحيحة',
        );

      case 'email-already-in-use':
        return const AppFirebaseAuthException(
          message: 'البريد الإلكتروني مستخدم بالفعل',
        );

      case 'weak-password':
        return const AppFirebaseAuthException(
          message: 'كلمة المرور ضعيفة',
        );

      case 'operation-not-allowed':
        return const AppFirebaseAuthException(
          message: 'هذه العملية غير مسموحة',
        );

      case 'too-many-requests':
        return const AppFirebaseAuthException(
          message: 'تم إجراء محاولات كثيرة، حاول مرة أخرى لاحقًا',
        );

      case 'network-request-failed':
        return const AppFirebaseAuthException(
          message: 'حدث خطأ في الاتصال بالإنترنت',
        );

      case 'invalid-credential':
        return const AppFirebaseAuthException(
          message: 'بيانات تسجيل الدخول غير صحيحة',
        );

      case 'account-exists-with-different-credential':
        return const AppFirebaseAuthException(
          message:
              'يوجد حساب مرتبط بهذا البريد الإلكتروني بطريقة تسجيل دخول أخرى',
        );

      case 'requires-recent-login':
        return const AppFirebaseAuthException(
          message: 'يرجى تسجيل الدخول مرة أخرى لإتمام هذه العملية',
        );

      default:
        return const AppFirebaseAuthException(
          message: 'حدث خطأ أثناء المصادقة، حاول مرة أخرى',
        );
    }
  }
}

class ValidationException extends AppException {
  const ValidationException({
    required super.message,
  });
}
