import 'package:dartz/dartz.dart';
import 'package:noteflow/core/errors/app_exceptions.dart';
import 'package:noteflow/core/errors/failure.dart';
import 'package:noteflow/features/home/data/datasources/home_remote.dart';
import 'package:noteflow/features/home/data/models/note_model.dart';
import 'package:noteflow/features/home/domain/entities/note_entity.dart';
import 'package:noteflow/features/home/domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemote homeRemote;

  HomeRepoImpl({required this.homeRemote});
  @override
  Future<Either<Failure, String>> addNote({required NoteEntity addNote}) async {
    try {
      final res = await homeRemote.addNote(
        addNote: NoteModel.fromEntity(addNote),
      );
      return right(res);
    } on AppException catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NoteEntity>>> getNotes() async {
    try {
      final res = await homeRemote.getNotes();
      return right(res);
    } on AppException catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
