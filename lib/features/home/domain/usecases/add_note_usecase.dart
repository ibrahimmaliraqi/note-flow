import 'package:dartz/dartz.dart';
import 'package:noteflow/core/errors/failure.dart';
import 'package:noteflow/features/home/domain/entities/note_entity.dart';
import 'package:noteflow/features/home/domain/repositories/home_repo.dart';

class AddNoteUsecase {
  final HomeRepo homeRepo;

  AddNoteUsecase({required this.homeRepo});
  Future<Either<Failure, String>> call({required NoteEntity addNote}) {
    return homeRepo.addNote(addNote: addNote);
  }
}
