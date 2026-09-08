import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:noteflow/features/home/domain/entities/note_entity.dart';
import 'package:noteflow/features/home/domain/usecases/get_notes_usercase.dart';

part 'get_notes_state.dart';

class GetNotesCubit extends Cubit<GetNotesState> {
  final GetNotesUsercase getNotesUsercase;
  GetNotesCubit({required this.getNotesUsercase}) : super(GetNotesInitial());
  Future getNotes() async {
    emit(GetNotesLoading());
    final res = await getNotesUsercase.call();
    res.fold(
      (l) => emit(GetNotesFailure(message: l.message)),
      (r) => emit(GetNotesSuccess(notes: r)),
    );
  }
}
