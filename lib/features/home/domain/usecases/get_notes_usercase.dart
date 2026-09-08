import 'package:dartz/dartz.dart';
import 'package:noteflow/core/errors/failure.dart';
import 'package:noteflow/features/home/domain/entities/note_entity.dart';
import 'package:noteflow/features/home/domain/repositories/home_repo.dart';

class GetNotesUsercase {
  final HomeRepo homeRepo;

  GetNotesUsercase({required this.homeRepo});
  Future<Either<Failure, List<NoteEntity>>> call() {
    return homeRepo.getNotes();
  }
}
