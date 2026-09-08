import 'package:dartz/dartz.dart';
import 'package:noteflow/core/errors/failure.dart';
import 'package:noteflow/features/home/domain/entities/note_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, String>> addNote({required NoteEntity addNote});
  Future<Either<Failure, List<NoteEntity>>> getNotes();
}
