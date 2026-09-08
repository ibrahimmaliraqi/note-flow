import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteflow/core/demo/demo_notes.dart';
import 'package:noteflow/core/widgets/empty_widget.dart';
import 'package:noteflow/core/widgets/failure_widget.dart';
import 'package:noteflow/features/home/presentation/manager/get_notes/get_notes_cubit.dart';
import 'package:noteflow/features/home/presentation/widgets/note_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NotListBloc extends StatelessWidget {
  const NotListBloc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotesCubit, GetNotesState>(
      builder: (context, state) {
        if (state is GetNotesSuccess) {
          if (state.notes.isEmpty) {
            return EmptyListWidget(
              title: 'لا توجد ملاحظات',
              subtitle: 'ابدأ بإضافة ملاحظتك الأولى',
              icon: Icons.note_alt_outlined,
            );
          }
          return NotesList(
            notes: state.notes,
          );
        } else if (state is GetNotesLoading) {
          return Skeletonizer(
            enabled: true,
            child: NotesList(
              notes: demoNotes,
            ),
          );
        } else if (state is GetNotesFailure) {
          return FailureWidget(
            message: state.message,
            onRetry: () {
              context.read<GetNotesCubit>().getNotes();
            },
          );
        }
        return SizedBox();
      },
    );
  }
}
