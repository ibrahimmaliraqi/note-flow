import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:noteflow/features/home/domain/entities/note_entity.dart';
import 'package:noteflow/features/home/domain/usecases/add_note_usecase.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  final AddNoteUsecase addNoteUsecase;
  AddNoteCubit({required this.addNoteUsecase}) : super(AddNoteInitial());
  Future addNote({required NoteEntity addNote}) async {
    emit(AddNoteLoading());
    final res = await addNoteUsecase.call(addNote: addNote);
    res.fold(
      (l) => emit(AddNoteFailure(message: l.message)),
      (r) => emit(AddNoteSuccess(message: r)),
    );
  }
}
