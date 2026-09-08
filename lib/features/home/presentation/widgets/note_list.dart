import 'package:flutter/material.dart';
import 'package:noteflow/features/home/presentation/widgets/note_cart.dart';

class NotesList extends StatelessWidget {
  const NotesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: 5,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return NoteCard();
      },
    );
  }
}
