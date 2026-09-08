import 'package:flutter/material.dart';
import 'package:noteflow/features/home/presentation/widgets/note_list.dart';

class NotListBloc extends StatelessWidget {
  const NotListBloc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NotesList();
  }
}
