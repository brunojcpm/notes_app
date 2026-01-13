import 'package:flutter/material.dart';
import 'package:notes_app/data/services/logger.service.dart';
import 'package:notes_app/domains/note/use_cases/create_note.use_case.dart';
import 'package:notes_app/ui/ui.dart';

import 'package:notes_app/domains/note/models/note.model.dart';
import 'package:notes_app/shared/command.dart';
import 'package:notes_app/shared/result.dart';

class NoteFormViewModel extends ChangeNotifier {
  final CreateNoteUseCase _createNoteUseCase;

  Note note = Note.empty();

  late Command1<void, NoteFormModel> save;

  NoteFormViewModel({required CreateNoteUseCase createNoteUseCase})
    : _createNoteUseCase = createNoteUseCase {
    save = Command1(_save);
  }

  Future<Result> _save(NoteFormModel formModel) async {
    try {
      final noteCreated = await _createNoteUseCase.execute(
        title: formModel.title ?? '',
        description: formModel.description,
      );

      switch (noteCreated) {
        case Ok<Note>():
          note = noteCreated.value;
          logger.info('Note created and saved successfully');
        case Error<Note>():
          throw noteCreated.error;
      }

      return noteCreated;
    } catch (error, stackTrace) {
      logger.error(
        'Error to create or save note',
        stackTrace: stackTrace,
        error: error,
      );
      return Result.error(Exception(error));
    }
  }
}
