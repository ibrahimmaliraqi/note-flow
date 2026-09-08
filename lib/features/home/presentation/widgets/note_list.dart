import 'package:flutter/material.dart';
import 'package:noteflow/features/home/domain/entities/note_entity.dart';
import 'package:noteflow/features/home/presentation/widgets/note_cart.dart';

class NotesList extends StatelessWidget {
  final List<NoteEntity> notes;
  const NotesList({
    super.key,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: notes.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return NoteCard(
          note: notes[index],
        );
      },
    );
  }
}
