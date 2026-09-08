import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:noteflow/core/constants/app_constants.dart';
import 'package:noteflow/core/errors/app_exceptions.dart';
import 'package:noteflow/core/helper/prefs_helper.dart';
import 'package:noteflow/features/home/data/models/note_model.dart';

abstract class HomeRemote {
  Future<String> addNote({required NoteModel addNote});
  Future<List<NoteModel>> getNotes();
}

class HomeFirebaseRemoteImpl implements HomeRemote {
  final collection = FirebaseFirestore.instance.collection(AppConstants.dbUser);
  @override
  Future<String> addNote({required NoteModel addNote}) async {
    try {
      print("locallllllllll");
      print(PrefsHelper.getUser()!.id);
      await collection
          .doc(PrefsHelper.getUser()!.id)
          .collection(AppConstants.dbNote)
          .add(addNote.toMap());
      return 'تمت إضافة الملاحظة بنجاح';
    } on FirebaseException catch (e) {
      throw ServerException(message: e.code);
    }
  }

  @override
  Future<List<NoteModel>> getNotes() async {
    try {
      final res = await collection
          .doc(PrefsHelper.getUser()!.id)
          .collection(AppConstants.dbNote)
          .orderBy("createAt", descending: true)
          .get();
      return res.docs.map((e) => NoteModel.fromMap(e.data())).toList();
    } on FirebaseException catch (e) {
      throw ServerException(message: e.code);
    }
  }
}
